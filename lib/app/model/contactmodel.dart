import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ContactModel extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? location;
  final String? fcmtoken;
  final String? addtime;

  ContactModel(
      {this.id,
      this.name,
      this.email,
      this.photoUrl,
      this.location,
      this.fcmtoken,
      this.addtime});

  factory ContactModel.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ContactModel(
      id: data?['id'],
      name: data?['name'],
      email: data?['email'],
      photoUrl: data?['photoUrl'],
      location: data?['location'],
      fcmtoken: data?['fcmtoken'],
      addtime: data?['addtime'],
    );
  }
  static ContactModel fromSnapshot(QueryDocumentSnapshot snap) {
    ContactModel contactModel = ContactModel(
      name: snap['name'],
      email: snap['email'],
      addtime: snap['addtime'],
      fcmtoken: snap['fcmtoken'],
      id: snap['id'],
      location: snap['location'],
      photoUrl: snap['photoUrl'],
    );
    return contactModel;
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

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, email, photoUrl, location, fcmtoken, addtime];
  // factory UserDetailsModel.getModelFromJson(
  //     {required Map<String, dynamic> json}) {
  //   return UserDetailsModel(
  //       name: json["name"],
  //       email: json["email"],
  //       uId: json["uId"],
  //       imageurl: json["imageurl"],
  //       address: json["address"],
  //       phone: json["phone"]);
  // }
}
