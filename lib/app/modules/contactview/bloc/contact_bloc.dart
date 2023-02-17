import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jee_chat/app/model/usermodels.dart';
import 'package:jee_chat/service/contact_database.service.dart';

import 'contact_state.dart';

part 'contact_event.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final ContactDatabaseService _databaseRepository;
  DatabaseBloc(this._databaseRepository) : super(DatabaseInitial()) {
    on<DatabaseFetched>(_fetchUserData);
  }

  _fetchUserData(DatabaseFetched event, Emitter<DatabaseState> emit) async {
    List<UserModel> listofUserData =
        await _databaseRepository.retrieveUserDatas();
    emit(DatabaseSuccess(
      listofUserData,
    ));
  }
}
