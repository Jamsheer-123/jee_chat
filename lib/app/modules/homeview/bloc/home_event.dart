part of 'home_bloc.dart';

// abstract class HomeEvent extends Equatable {
//   const HomeEvent();

//   @override
//   List<Object?> get props => [];
// }

// class DatabaseFetcheds extends HomeEvent {
//   final String? displayName;
//   const DatabaseFetcheds(this.displayName);
//   @override
//   List<Object?> get props => [displayName];
// }

///////////////
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadMessages extends HomeEvent {
  const LoadMessages();

  @override
  List<Object> get props => [];
}

class AddMessage extends HomeEvent {
  final Message message;

  const AddMessage({required this.message});

  @override
  List<Object> get props => [message];
}
