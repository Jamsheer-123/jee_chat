// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jee_chat/app/model/userdata_entirymodell.dart';
import 'package:jee_chat/app/model/usermodels.dart';
import 'package:bloc/bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['openid']);
FirebaseFirestore db = FirebaseFirestore.instance;

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      // ignore: unnecessary_type_check
      if (event is AuthenticationEvent) {
        try {
          var googleUser = await googleSignIn.signIn();

          if (googleUser != null) {
            final googleAuthentication = await googleUser.authentication;

            final credential = GoogleAuthProvider.credential(
                accessToken: googleAuthentication.accessToken,
                idToken: googleAuthentication.idToken);

            try {
              await FirebaseAuth.instance.signInWithCredential(credential);
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
              print(e);
            }
          }

          return emit(SignUpSuccess());
        } on FirebaseException catch (e) {
          return emit(
            SignUPFailed(error_message: e.code),
          );
        }
      }
    });
  }
}
