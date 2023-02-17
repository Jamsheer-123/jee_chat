import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:jee_chat/app/model/single_messegemodel.dart';
import 'package:jee_chat/app/model/single_messegemodel.dart';
import 'package:jee_chat/app/modules/chat_view/widget/chat_bubble.dart';
import 'package:jee_chat/repository/chatpage_route_repository.dart';

class ChatList extends StatelessWidget {
  ChatList({
    super.key,
    required this.passingAgument,
  });
  final PassingAgument passingAgument;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("messeges")
          .doc(passingAgument.doc_id)
          .collection("messegelist")
          .orderBy("addTime", descending: false)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return CustomScrollView(
            // reverse: true,
            slivers: [
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: snapshot.data!.docs.length,
                (context, index) {
                  MesseageModel messeageModel = MesseageModel.getModelFromJson(
                      json: snapshot.data!.docs[index].data());

                  return ChatBubble(
                    passingAgument: passingAgument,
                    content: messeageModel.content!,
                    userId: messeageModel.uId!,
                  );
                },
              ))
            ],
          );
        }
      },
    );
  }
}
