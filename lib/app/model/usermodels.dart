import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? location;
  final String? fcmtoken;
  final String? addtime;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.photoUrl,
      this.location,
      this.fcmtoken,
      this.addtime});

  factory UserModel.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      id: data?['id'],
      name: data?['name'],
      email: data?['email'],
      photoUrl: data?['photoUrl'],
      location: data?['location'],
      fcmtoken: data?['fcmtoken'],
      addtime: data?['addtime'],
    );
  }
  static UserModel fromSnapshot(QueryDocumentSnapshot snap) {
    UserModel userModel = UserModel(
      name: snap['name'],
      email: snap['email'],
      addtime: snap['addtime'],
      fcmtoken: snap['fcmtoken'],
      id: snap['id'],
      location: snap['location'],
      photoUrl: snap['photoUrl'],
    );
    return userModel;
  }

  Map<String, dynamic> getJson() => {
        'id': id,
        'name': name,
        'email': email,
        'photoUrl': photoUrl,
      };

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (photoUrl != null) "photoUrl": photoUrl,
      if (location != null) "location": location,
      if (fcmtoken != null) "fcmtoken": fcmtoken,
      if (addtime != null) "addtime": addtime,
    };
  }

  factory UserModel.getModelFromJson({required Map<String, dynamic> json}) {
    return UserModel(
        name: json["name"],
        email: json["email"],
        id: json["id"],
        photoUrl: json["photoUrl"],
        location: json["location"],
        addtime: json["addtime"],
        fcmtoken: json["fcmtoken"]);
  }
}
