import 'package:cloud_firestore/cloud_firestore.dart';

class Msg {
  final String? fromId;
  final String toId;
  final String? fromName;
  final String? toName;
  final String? fromAvathar;
  final String? toAvathar;
  final String? lastMessage;
  final Timestamp? lastTime;
  final int? msgNo;

  Msg(
      {this.fromId,
      required this.toId,
      this.fromName,
      this.toName,
      this.fromAvathar,
      this.toAvathar,
      this.lastMessage,
      this.msgNo,
      this.lastTime});

  factory Msg.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Msg(
      fromId: data?['fromId'],
      toId: data?['toId'],
      fromName: data?['fromName'],
      toName: data?['toName'],
      fromAvathar: data?['fromAvathar'],
      toAvathar: data?['toAvathar'],
      lastMessage: data?['lastMessage'],
      msgNo: data?['msgNo'],
      lastTime: data?['lastTime'],
    );
  }
  static Msg fromSnapshot(QueryDocumentSnapshot snap) {
    Msg userModel = Msg(
      fromId: snap['fromId'],
      toId: snap['toId'],
      fromName: snap['fromName'],
      toName: snap['toName'],
      fromAvathar: snap['fromAvathar'],
      toAvathar: snap['toAvathar'],
      lastMessage: snap['lastMessage'],
      msgNo: snap['msgNo'],
      lastTime: snap['lastTime'],
    );
    return userModel;
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (fromId != null) "fromId": fromId,
      if (toId != null) "toId": toId,
      if (toName != null) "toName": toName,
      if (msgNo != null) "msgNo": msgNo,
      if (fromName != null) "fromName": fromName,
      if (fromAvathar != null) "fromAvathar": fromAvathar,
      if (toAvathar != null) "toAvathar": toAvathar,
      if (lastMessage != null) "lastMessage": lastMessage,
      if (lastTime != null) "lastTime": lastTime,
    };
  }

  factory Msg.getModelFromJson({required Map<String, dynamic> json}) {
    return Msg(
        fromName: json["fromName"],
        toId: json["toId"],
        fromId: json["fromId"],
        fromAvathar: json["fromAvathar"],
        toAvathar: json["toAvathar"],
        msgNo: json["msgNo"],
        lastTime: json["lastTime"],
        lastMessage: json["lastMessage"]);
  }
}
