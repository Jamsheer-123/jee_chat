import 'package:equatable/equatable.dart';
import 'package:jee_chat/app/model/usermodels.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();

  @override
  List<Object?> get props => [];
}

class DatabaseInitial extends DatabaseState {}

class DatabaseSuccess extends DatabaseState {
  final List<UserModel> listOfUserData;
  const DatabaseSuccess(this.listOfUserData);

  @override
  List<Object?> get props => [
        listOfUserData,
      ];
}

class DatabaseError extends DatabaseState {
  @override
  List<Object?> get props => [];
}
