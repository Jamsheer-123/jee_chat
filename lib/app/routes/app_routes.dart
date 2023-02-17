import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jee_chat/app/modules/chat_view/chatview.dart';
import 'package:jee_chat/app/routes/app_rout.dart';
import 'package:jee_chat/repository/chatpage_route_repository.dart';

class AppRoutes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case chatView:
        return MaterialPageRoute(
          builder: (context) => ChatView(),
        );

      case "cxcss":
        return MaterialPageRoute(
          builder: (context) => ChatView(),
        );

      default:
    }
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Text("No ROute define"),
      ),
    );
  }
}
