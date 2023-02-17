import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jee_chat/app/model/msg.dart';
import 'package:jee_chat/app/model/usermodels.dart';
import 'package:jee_chat/infastructure/managers/user_manager.dart';

class HomeViewDatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  // final _firebaseAuth = FirebaseAuth.instance;

  Future<List<Msg>> retrieveUserDatas() {
    return UserManager.intUser().then((value) async {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _db.collection("messeges").get();

      return snapshot.docs
          .where((element) =>
              element["fromId"] == UserManager.userId ||
              element["toId"] == UserManager.userId)
          .map((docSnapshot) => Msg.fromSnapshot(docSnapshot))
          .toList();
    });
    // String id = UserManager.userId;
  }
}
