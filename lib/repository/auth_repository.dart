import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:jee_chat/app/model/userdata_entirymodell.dart';
import 'package:jee_chat/app/model/usermodels.dart';
import 'package:jee_chat/app/modules/sinup/bloc/authentication_bloc.dart';
import 'package:jee_chat/infastructure/managers/sharedpreference.dart';
import 'package:jee_chat/infastructure/managers/user_manager.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    try {
      var googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final googleAuthentication = await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuthentication.accessToken,
            idToken: googleAuthentication.idToken);

        try {
          await FirebaseAuth.instance.signInWithCredential(credential);
          await UserManager.saveUserId(googleUser.id);

          String displayName = googleUser.displayName ?? googleUser.email;

          String email = googleUser.email;
          String id = googleUser.id;
          String photoUrl = googleUser.photoUrl ?? "";
          // ignore: non_constant_identifier_names
          UserDataEntityModel userDataEntityModel = UserDataEntityModel();
          userDataEntityModel.accessToken = id;
          userDataEntityModel.email = email;
          userDataEntityModel.displayName = displayName;
          userDataEntityModel.photoUrl = photoUrl;
          await UserManager.saveUserFullDeatils(userDataEntityModel);

          var userbase = await db
              .collection("users")
              .withConverter(
                  fromFirestore: UserModel.fromFireStore,
                  toFirestore: (UserModel userModel, options) =>
                      userModel.toFirestore())
              .where("id", isEqualTo: id)
              .get();
          if (userbase.docs.isEmpty) {
            final data = UserModel(
                email: email,
                fcmtoken: "",
                photoUrl: photoUrl,
                id: id,
                location: "",
                addtime: Timestamp.now().toString(),
                name: displayName);
            await db
                .collection("users")
                .withConverter(
                    fromFirestore: UserModel.fromFireStore,
                    toFirestore: (UserModel userModel, options) =>
                        userModel.toFirestore())
                .add(data);
          }
        } on FirebaseException catch (e) {
          log(e.code);
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await googleSignIn.signOut();
      SharedPreferenceManager.instance.clear("userId");

      UserManager.logOutUser();
    } catch (e) {
      throw Exception(e);
    }
  }
}
