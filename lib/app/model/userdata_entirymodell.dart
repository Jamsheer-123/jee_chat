class UserDataEntityModel {
  String? accessToken;
  String? displayName;
  String? email;
  String? photoUrl;

  UserDataEntityModel(
      {this.accessToken, this.displayName, this.email, this.photoUrl});
  factory UserDataEntityModel.fromJson(Map<String, dynamic> json) =>
      UserDataEntityModel(
        accessToken: json['accessToken'],
        displayName: json['displayName'],
        email: json['email'],
        photoUrl: json['photoUrl'],
      );

  Map<String, dynamic> getJson() => {
        'accessToken': accessToken,
        'displayName': displayName,
        'email': email,
        'photoUrl': photoUrl,
      };
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
