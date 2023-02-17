import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jee_chat/app/model/userdata_entirymodell.dart';
import 'package:jee_chat/app/model/usermodels.dart';
import 'package:jee_chat/app/modules/sinup/bloc/authentication_bloc.dart';
import 'package:jee_chat/app/routes/app_rout.dart';
import 'package:jee_chat/infastructure/managers/user_manager.dart';

import '../app/model/msg.dart';

class ChatePageRoute {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  goChatPage(UserModel userModel, context) async {
    UserManager.intUser();

    var fromMessage = await firebaseFirestore
        .collection("messeges")
        .withConverter(
            fromFirestore: Msg.fromFireStore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("fromId", isEqualTo: UserManager.userId)
        .where("toId", isEqualTo: userModel.id)
        .get();

    var toMessage = await firebaseFirestore
        .collection("messeges")
        .withConverter(
            fromFirestore: Msg.fromFireStore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("fromId", isEqualTo: userModel.id)
        .where("toId", isEqualTo: UserManager.userId)
        .get();

    if (fromMessage.docs.isEmpty && toMessage.docs.isEmpty) {
      UserManager.intUser();

      UserDataEntityModel profile = UserManager.userFullDeatils;
      // log(profile.email.toString());

      // UserDataEntityModel userData =
      //     UserDataEntityModel.fromJson(jsonDecode(profile.email));
      var msgData = Msg(
          fromId: UserManager.userId,
          toId: userModel.id!,
          fromName: UserManager.userFullDeatils.displayName.toString(),
          toName: userModel.name,
          fromAvathar: UserManager.userFullDeatils.photoUrl.toString(),
          toAvathar: userModel.photoUrl,
          lastMessage: "",
          lastTime: Timestamp.now(),
          msgNo: 0);
      db
          .collection("messeges")
          .withConverter(
              fromFirestore: Msg.fromFireStore,
              toFirestore: (Msg msg, options) => msg.toFirestore())
          .add(msgData)
          .then(
              (value) => Navigator.pushNamed(context, "chatviews", arguments: {
                    "doc_id": value.id,
                    "to_userid": userModel.id,
                    "to_name": userModel.name,
                    "to_avathar": userModel.photoUrl,
                  }));
    } else {
      if (fromMessage.docs.isNotEmpty) {
        Navigator.pushNamed(context, "chatviews",
            arguments: PassingAgument(
                doc_id: fromMessage.docs.first.id,
                to_avathar: userModel.photoUrl!,
                to_userid: userModel.id!,
                to_name: userModel.name!));
      }
      if (toMessage.docs.isNotEmpty) {
        Navigator.pushNamed(context, "chatviews",
            arguments: PassingAgument(
                doc_id: toMessage.docs.first.id,
                to_avathar: userModel.photoUrl!,
                to_userid: userModel.id!,
                to_name: userModel.name!));
      }
    }
  }
}

class PassingAgument {
  String doc_id;
  String to_userid;
  String to_name;
  String to_avathar;

  PassingAgument({
    required this.doc_id,
    required this.to_avathar,
    required this.to_userid,
    required this.to_name,
  });
  factory PassingAgument.getModelFromJson(
      {required Map<String, dynamic> json}) {
    return PassingAgument(
        doc_id: json["doc_id"],
        to_avathar: json["to_avathar"],
        to_userid: json["to_userid"],
        to_name: json["to_name"]);
  }
}
