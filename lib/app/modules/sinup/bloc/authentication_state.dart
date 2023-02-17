part of 'authentication_bloc.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class SignUpSuccess extends AuthenticationState {}

class SignUPFailed extends AuthenticationState {
  String error_message;

  SignUPFailed({required this.error_message});
}
