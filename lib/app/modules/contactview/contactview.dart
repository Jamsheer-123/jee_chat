import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jee_chat/app/modules/contactview/bloc/contact_bloc.dart';
import 'package:jee_chat/infastructure/constand/utils/color.constands.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jee_chat/infastructure/managers/user_manager.dart';
import 'package:jee_chat/repository/chatpage_route_repository.dart';

import 'bloc/contact_state.dart';

class ContactView extends StatelessWidget {
  ContactView({super.key});
  @override
  Widget build(BuildContext context) {
    UserManager.intUser();
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   centerTitle: true,
          //   title: Text(UserManager.userId.toString()),
          // ),
          body: BlocBuilder<DatabaseBloc, DatabaseState>(
        builder: (context, state) {
          if (state is DatabaseSuccess) {
            // context.read<DatabaseBloc>().add(DatabaseFetched("scasd"));
          }
          if (state is DatabaseInitial) {
            context.read<DatabaseBloc>().add(DatabaseFetched("ascascascsac"));
            return const Center(child: CircularProgressIndicator());
          } else if (state is DatabaseSuccess) {
            if (state.listOfUserData.isEmpty) {
              return const Center(
                child: Text("THere Is No Contact"),
              );
            } else {
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: state.listOfUserData.length,
                        (context, index) {
                      return ListTile(
                        onTap: () {
                          ChatePageRoute()
                              .goChatPage(state.listOfUserData[index], context);
                        },
                        leading: Container(
                          width: 60,
                          height: 60,
                          child: CachedNetworkImage(
                              fit: BoxFit.contain,
                              imageUrl: state.listOfUserData[index].photoUrl!
                                  .toString()),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                        title: Text(
                          state.listOfUserData[index].name!,
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          state.listOfUserData[index].email!,
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      );
                    }),
                  )
                ],
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )),
    );
  }
}
