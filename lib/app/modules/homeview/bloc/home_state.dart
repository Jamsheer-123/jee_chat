part of 'home_bloc.dart';

// abstract class HomeState extends Equatable {
//   const HomeState();

//   @override
//   List<Object?> get props => [];
// }

// class HomeInitial extends HomeState {}

// class DatabaseSuccess extends HomeState {
//   final List<Msg> listOfUserData;
//   const DatabaseSuccess(this.listOfUserData);

//   @override
//   List<Object?> get props => [
//         listOfUserData,
//       ];
// }

// class DatabaseError extends HomeState {
//   @override
//   List<Object?> get props => [];
// }

abstract class HomeState extends Equatable {
  const HomeState();
}

class ChatLoading extends HomeState {
  const ChatLoading();

  @override
  List<Object> get props => [];
}

class ChatLoaded extends HomeState {
  final List<Msg> messages;

  const ChatLoaded({required this.messages});

  @override
  List<Object> get props => [messages];
}

class ChatError extends HomeState {
  final String error;

  const ChatError({required this.error});

  @override
  List<Object> get props => [error];
}

class Message {
  final String content;
  final String sender;

  const Message({required this.content, required this.sender});
}
