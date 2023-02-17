import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jee_chat/app/modules/contactview/contactview.dart';
import 'package:jee_chat/app/modules/profileview/profileview.dart';
import 'package:jee_chat/app/modules/sinup/bloc/auth_bloc.dart';
import 'package:jee_chat/app/modules/sinup/sinupview.dart';
import 'package:jee_chat/infastructure/constand/utils/color.constands.dart';

import '../homeview/homeview.dart';

class DashPage extends StatelessWidget {
  DashPage({super.key});
  final ValueNotifier<int> postionNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            // Navigate to the sign in screen when the user Signs Out
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Sinup()),
              (route) => false,
            );
          }
        },
        child: Scaffold(
            body: ValueListenableBuilder(
              valueListenable: postionNotifier,
              builder: (context, value, child) {
                return IndexedStack(
                  index: value,
                  children: [
                    HomeView(),
                    ContactView(),
                    ProfileView(),
                  ],
                );
              },
            ),
            bottomNavigationBar: ValueListenableBuilder(
                valueListenable: postionNotifier,
                builder: (context, position, child) {
                  return BottomNavigationBar(
                    onTap: (value) {
                      postionNotifier.value = value;
                      print(value.toString());
                    },
                    currentIndex: position,
                    backgroundColor: AppColors.white,
                    items: [
                      BottomNavigationBarItem(
                        icon: Container(
                          margin: const EdgeInsets.only(bottom: 7),
                          child: const Icon(
                            Icons.messenger,
                            size: 20.0,
                          ),
                        ),
                        label: 'Messege',
                        backgroundColor: AppColors.colorPrimary,
                      ),
                      BottomNavigationBarItem(
                        icon: Container(
                          margin: const EdgeInsets.only(bottom: 7),
                          child: const Icon(
                            Icons.account_circle,
                            size: 20.0,
                          ),
                        ),
                        label: 'Contact',
                        backgroundColor: AppColors.colorPrimary,
                      ),
                      BottomNavigationBarItem(
                        icon: Container(
                          margin: const EdgeInsets.only(bottom: 7),
                          child: const Icon(
                            Icons.settings,
                            size: 20.0,
                          ),
                        ),
                        label: 'Settings',
                        backgroundColor: AppColors.colorPrimary,
                      ),
                    ],
                  );
                })));
  }
}
