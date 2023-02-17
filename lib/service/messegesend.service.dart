import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jee_chat/app/model/single_messegemodel.dart';

class SendMessage {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future senddToFirbase(
    String doc_id,
    String uId,
    String type,
    String content,
  ) async {
    MesseageModel messeageModel = MesseageModel(
        type: type,
        uId: uId,
        content: content,
        addTime: Timestamp.now().toDate().toLocal().toString());
    await _db
        .collection("messeges")
        .doc(doc_id)
        .collection("messegelist")
        .withConverter(
            fromFirestore: MesseageModel.fromFireStore,
            toFirestore: (MesseageModel messeageModel, options) =>
                messeageModel.toFirestore())
        .add(messeageModel)
        .then((value) => print("vsvs"));

    await _db
        .collection("messeges")
        .doc(doc_id)
        .update({"lastMessage": content, "lastTime": Timestamp.now().toDate()});
  }

  Stream<List<MesseageModel>> chatRetrive(String doc_id) async* {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _db
        .collection("messeges")
        .doc(doc_id)
        .collection("messegelist")
        .get();
    yield snapshot.docs
        .map((docSnapshot) => MesseageModel.fromSnapshot(docSnapshot))
        .toList();
  }
}
