import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jee_chat/app/model/msg.dart';
import 'package:jee_chat/infastructure/managers/user_manager.dart';

part 'home_event.dart';
part 'home_state.dart';

// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   final HomeViewDatabaseService _databaseRepository;

//   HomeBloc(this._databaseRepository) : super(HomeInitial()) {
//     on<DatabaseFetcheds>(_fetchUserData);
//   }
//   _fetchUserData(DatabaseFetcheds event, Emitter<HomeState> emit) async {
//     List<Msg> listofUserData = await _databaseRepository.retrieveUserDatas();
//     emit(DatabaseSuccess(
//       listofUserData,
//     ));
//   }
// }

////////////////////////////

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _database = FirebaseFirestore.instance.collection('messeges').get();

  HomeBloc()
      : super(
          ChatLoading(),
        ) {
    UserManager.intUser();
    on<LoadMessages>(_mapLoadMessagesToState);
  }

  // HomeBloc(super.initialState);

  // @override
  // HomeState get initialState => ChatLoading();

  _mapLoadMessagesToState(LoadMessages event, Emitter<HomeState> emit) async {
    final messages = await FirebaseFirestore.instance
        .collection('messeges')
        .get()
        .then((value) => value.docs
            .where((element) =>
                element["fromId"] == UserManager.userId ||
                element["toId"] == UserManager.userId)
            .map((docSnapshot) => Msg.fromSnapshot(docSnapshot))
            .toList());

    // ignore: invalid_use_of_visible_for_testing_member
    emit(ChatLoaded(messages: messages));
  }

  // Stream<HomeState> _mapAddMessageToState(AddMessage event) async* {
  //   await _database.push().set(event.message);
  //   add(LoadMessages());
  // }
}
