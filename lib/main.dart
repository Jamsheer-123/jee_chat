import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jee_chat/app/modules/chat_view/bloc/messege_bloc.dart';
import 'package:jee_chat/app/modules/chat_view/chatview.dart';
import 'package:jee_chat/app/modules/contactview/bloc/contact_bloc.dart';
import 'package:jee_chat/app/modules/dash/dashpage.dart';
import 'package:jee_chat/app/modules/homeview/bloc/home_bloc.dart';
import 'package:jee_chat/app/modules/sinup/sinupview.dart';
import 'package:jee_chat/infastructure/index.dart';
import 'package:jee_chat/repository/auth_repository.dart';
import 'package:jee_chat/service/contact_database.service.dart';
import 'package:jee_chat/service/homeview_database.dart';

import 'app/modules/sinup/bloc/auth_bloc.dart';
import 'app/modules/sinup/bloc/bloc_observable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authRepository: AuthRepository()),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => DatabaseBloc((ContactDatabaseService())),
        ),
        BlocProvider(
          create: (context) => MessegeBloc(),
        )
      ],
      child: MaterialApp(
        // onGenerateRoute: AppRoutes.generateRoutes,r
        routes: {
          "chatviews": (context) => ChatView(),
        },
        debugShowCheckedModeBanner: false,
        theme: appThemeData,
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              // If the snapshot has user data, then they're already signed in. So Navigating to the Dashboard.
              if (snapshot.hasData) {
                return DashPage();
              }
              // Otherwise, they're not signed in. Show the sign in page.
              return Sinup();
            }),
      ),
    );
  }
}
