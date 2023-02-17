import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jee_chat/infastructure/constand/utils/color.constands.dart';
import 'package:jee_chat/repository/chatpage_route_repository.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble(
      {super.key,
      required this.content,
      required this.userId,
      required this.passingAgument});

  final PassingAgument passingAgument;
  final String content;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: userId == passingAgument.to_userid
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: userId == passingAgument.to_userid
                ? AppColors.grey600
                : AppColors.colorPrimary,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft: userId != passingAgument.to_userid
                    ? const Radius.circular(0)
                    : const Radius.circular(15),
                bottomRight: userId == passingAgument.to_userid
                    ? const Radius.circular(0)
                    : const Radius.circular(15)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            content,
            style: TextStyle(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
