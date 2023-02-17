import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MesseageModel extends Equatable {
  final String? uId;
  final String? content;
  final String? type;
  final String? addTime;

  MesseageModel({
    this.uId,
    this.content,
    this.type,
    this.addTime,
  });

  factory MesseageModel.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return MesseageModel(
      uId: data?['uId'],
      content: data?['content'],
      type: data?['type'],
      addTime: data?['addTime'],
    );
  }
  static MesseageModel fromSnapshot(QueryDocumentSnapshot snap) {
    MesseageModel messeageModel = MesseageModel(
      content: snap['content'],
      type: snap['type'],
      uId: snap['uId'],
      addTime: snap['addTime'],
    );
    return messeageModel;
  }

  Map<String, dynamic> getJson() => {
        'uId': uId,
        'content': content,
        'type': type,
        'addTime': addTime,
      };

  Map<String, dynamic> toFirestore() {
    return {
      if (uId != null) "uId": uId,
      if (content != null) "content": content,
      if (type != null) "type": type,
      if (addTime != null) "addTime": addTime,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        uId,
        content,
        type,
        addTime,
      ];
  factory MesseageModel.getModelFromJson({required Map<String, dynamic> json}) {
    return MesseageModel(
        content: json["content"],
        type: json["type"],
        uId: json["uId"],
        addTime: json["addTime"]);
  }
}
