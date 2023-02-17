// import 'package:jee_chat/app/model/contactmodel.dart';
// import 'package:jee_chat/app/model/usermodels.dart';

// abstract class BaseContactRepository {
//   Stream<List<ContactModel>> getContact();
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jee_chat/app/model/contactmodel.dart';
import 'package:jee_chat/app/model/single_messegemodel.dart';
import 'package:jee_chat/app/model/usermodels.dart';
import 'package:jee_chat/infastructure/managers/user_manager.dart';
import 'package:jee_chat/service/contact_database.service.dart';
import 'package:jee_chat/service/messegesend.service.dart';

// class ContactDatabaseRepositoryImpl implements ContactDatabaseRepository {
//   ContactDatabaseService service = ContactDatabaseService();

//   @override
//   Future<List<UserModel>> retrieveUserData(String id) {
//     UserManager.intUser();

//     return service.retrieveUserData(UserManager.userId);
//   }
// }

// abstract class ContactDatabaseRepository {
//   // Future<void> saveUserData(ContactModel user);
//   Future<List<UserModel>> retrieveUserData(String id);
// }

// class ChatDatabaseRepositoryImpl implements ChatDatabaseRepository {
//   SendMessage service = SendMessage();

//   @override
//   Stream<List<MesseageModel>> chatRetrive(String doc_id) {
//     UserManager.intUser();

//     return service.chatRetrive(doc_id);
//   }
// }

// abstract class ChatDatabaseRepository {
//   // Future<void> saveUserData(ContactModel user);
//   Stream<List<MesseageModel>> chatRetrive(String doc_id);
// }
