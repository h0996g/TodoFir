part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class ShowPasswordState extends LoginState {}

class LodinLoginState extends LoginState {}

class SignInWithEmailAndPasswordGood extends LoginState {
  final uid;

  SignInWithEmailAndPasswordGood(this.uid);
}

class SignInWithEmailAndPasswordBad extends LoginState {
  final error;

  SignInWithEmailAndPasswordBad(this.error);
}
