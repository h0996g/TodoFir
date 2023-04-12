part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class ShowPasswordState extends RegisterState {}

class ChangeIndexDepartementStateGood extends RegisterState {}

class ChangeDepartementControllerStateGood extends RegisterState {}

class LodinRegisterState extends RegisterState {}

class CreateUserWithEmailAndPasswordBad extends RegisterState {
  final error;

  CreateUserWithEmailAndPasswordBad(this.error);
}

class CreateUserGood extends RegisterState {
  final uid;

  CreateUserGood(this.uid);
}

class CreateUserBad extends RegisterState {
  final error;

  CreateUserBad(this.error);
}
