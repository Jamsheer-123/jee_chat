import 'package:firebase_auth/firebase_auth.dart';
import 'package:jee_chat/app/model/contactmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jee_chat/app/model/usermodels.dart';
import 'package:jee_chat/infastructure/managers/user_manager.dart';

class ContactDatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  Future<List<UserModel>> retrieveUserDatas() {
    return UserManager.intUser().then((value) async {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _db
          .collection("users")
          .where("id", isNotEqualTo: UserManager.userId)
          .get();
      return snapshot.docs
          .map((docSnapshot) => UserModel.fromSnapshot(docSnapshot))
          .toList();
    });
    // String id = UserManager.userId;
  }
}
