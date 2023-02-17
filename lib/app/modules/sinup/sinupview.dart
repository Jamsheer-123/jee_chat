import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jee_chat/app/modules/dash/dashpage.dart';
import 'package:jee_chat/infastructure/index.dart';

import 'bloc/auth_bloc.dart';
import 'bloc/authentication_bloc.dart';

class Sinup extends StatelessWidget {
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['openid']);

  Sinup({super.key});
  // ignore: non_constant_identifier_names
  final auth_bloc = AuthenticationBloc();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              // Navigating to the dashboard screen if the user is authenticated
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => DashPage(),
                ),
              );
            }
            if (state is AuthError) {
              // Displaying the error message if the user is not authenticated
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            if (state is Loading) {
              // Displaying the loading indicator while the user is signing up
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UnAuthenticated) {
              // Displaying the sign up form if the user is not authenticated
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    // margin: EdgeInsets.all(50),
                    width: 100,
                    height: 100,

                    child: Stack(
                      children: [
                        Positioned(
                            child: Container(
                          padding: EdgeInsets.all(15),
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: AppColors.colorPrimary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(36))),
                          child: Image.asset(
                            AppIcons.icon,
                            fit: BoxFit.contain,
                            width: 70,
                            height: 70,
                          ),
                        ))
                      ],
                    ),
                  ),
                  const Center(
                    child: Text(
                      "Lets Chat",
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 200),
                  Column(
                    children: [
                      const Text(
                        "Sigin  With Social NetWork",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SinupButtons(
                        iconImage: AppIcons.google,
                        text: " Goole Login",
                        onTap: () {
                          _authenticateWithGoogle(context);
                        },
                        // auth_bloc.add(SinInEvent())
                      ),
                      SinupButtons(
                          iconImage: AppIcons.google,
                          text: " Goole sinout",
                          onTap: () async {
                            await googleSignIn.signOut();
                            print("User Sign Out");
                          }),
                    ],
                  )
                ],
              );
            }
            return Container();
          },
        ),

        //  Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Container(
        //       margin: EdgeInsets.symmetric(vertical: 10),
        //       // margin: EdgeInsets.all(50),
        //       width: 100,
        //       height: 100,

        //       child: Stack(
        //         children: [
        //           Positioned(
        //               child: Container(
        //             padding: EdgeInsets.all(15),
        //             width: 100,
        //             height: 100,
        //             decoration: const BoxDecoration(
        //                 color: AppColors.colorPrimary,
        //                 borderRadius: BorderRadius.all(Radius.circular(36))),
        //             child: Image.asset(
        //               AppIcons.icon,
        //               fit: BoxFit.contain,
        //               width: 70,
        //               height: 70,
        //             ),
        //           ))
        //         ],
        //       ),
        //     ),
        //     const Center(
        //       child: Text(
        //         "Lets Chat",
        //         style: TextStyle(
        //             color: AppColors.white,
        //             fontWeight: FontWeight.w800,
        //             fontSize: 17),
        //         textAlign: TextAlign.center,
        //       ),
        //     ),
        //     const SizedBox(height: 200),
        //     Column(
        //       children: [
        //         const Text(
        //           "Sigin  With Social NetWork",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //         const SizedBox(
        //           height: 15,
        //         ),
        //         SinupButtons(
        //             iconImage: AppIcons.google,
        //             text: " Goole Login",
        //             onTap: () => auth_bloc.add(SinInEvent())),
        //         SinupButtons(
        //             iconImage: AppIcons.google,
        //             text: " Goole sinout",
        //             onTap: () async {
        //               await googleSignIn.signOut();
        //               print("User Sign Out");
        //             }),
        //       ],
        //     )
        //   ],
        // ),
      ),
    );
  }
}

void _authenticateWithGoogle(context) {
  BlocProvider.of<AuthBloc>(context).add(
    GoogleSignInRequested(),
  );
}
