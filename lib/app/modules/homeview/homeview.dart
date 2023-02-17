import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jee_chat/app/modules/homeview/bloc/home_bloc.dart';
import 'package:jee_chat/app/modules/homeview/bloc/widget/search_box.dart';
import 'package:jee_chat/infastructure/a.dart';
import 'package:jee_chat/infastructure/constand/utils/color.constands.dart';
import 'package:jee_chat/infastructure/managers/user_manager.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  TextEditingController serachController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    context.read<HomeBloc>().add(LoadMessages());

    UserManager.intUser();
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(95),
          child: AppBar(
            backgroundColor: AppColors.backgroundColor,
            elevation: 0,
            shadowColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.menu_sharp),
              onPressed: () {},
            ),
            title: Text(
              "CHatte",
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Righteous',
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_sharp,
                ),
              ),
            ],
            bottom: PreferredSize(
                child: SearchBox(
                  placeholder: "Search",
                  controller: serachController,
                ),
                preferredSize: Size.fromHeight(90)),
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is ChatLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 238, 244, 54),
                ),
              );
            }
            if (state is ChatError) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is ChatLoaded) {
              return Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: state.messages.length, (context, index) {
                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 13, vertical: 9),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      child: CachedNetworkImage(
                                        fit: BoxFit.contain,
                                        imageUrl: state
                                                    .messages[index].fromId ==
                                                UserManager.userId
                                            ? state.messages[index].toAvathar!
                                            : state
                                                .messages[index].fromAvathar!,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          width: 54,
                                          height: 54,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(54),
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.messages[index].fromId ==
                                                  UserManager.userId
                                              ? state.messages[index].toName!
                                              : state.messages[index].fromName!,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          state.messages[index].lastMessage!,
                                          style: TextStyle(
                                              color: AppColors.colorPrimary,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  duTimeLineFormat((state.messages[index]
                                          .lastTime! as Timestamp)
                                      .toDate()),
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ]),
                        );
                      }),
                    )
                  ],
                ),
              );
            }
            return CircularProgressIndicator(
              color: Colors.green,
            );
          },
        ),
      ),
    );
  }
}
