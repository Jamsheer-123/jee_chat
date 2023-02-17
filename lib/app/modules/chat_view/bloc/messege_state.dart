part of 'messege_bloc.dart';

abstract class MessegeState extends Equatable {
  const MessegeState();

  @override
  List<Object> get props => [];
}

class MessegeInitial extends MessegeState {}

class SendMessege extends MessegeState {}
