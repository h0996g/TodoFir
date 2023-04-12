import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Models/userModel.dart';
import '../../../../Shared/Components/constante.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  bool isvisibility = false;
  int indexDepartement = 1;
  final depController = TextEditingController(
    text: departementList[0],
  );

  void changeDepartementTask(int index) {
    depController.text = departementList[index];
    emit(ChangeDepartementControllerStateGood());
  }

  void showPassword() {
    isvisibility = !isvisibility;
    emit(ShowPasswordState());
  }

  void register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(LodinRegisterState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      // emit(CreateUserWithEmailAndPasswordGood());
      registerFirestore(
        uid: value.user!.uid,
        name: name,
        email: email,
        phone: phone,
      );
    }).catchError((e) {
      emit(CreateUserWithEmailAndPasswordBad(e.toString()));
    });
  }

  void registerFirestore(
      {required String uid,
      required String name,
      required String email,
      required String phone,
      isEmailVerified = false}) {
    UserModel model = UserModel(
      uid: uid,
      name: name,
      email: email,
      phone: phone,
      departement: depController.text,
      img:
          'https://img.freepik.com/free-vector/mafia-tiger-character-with-hat_23-2148473394.jpg?w=740&t=st=1663209025~exp=1663209625~hmac=38c128ec6235347df128b2ab45aa4fd38369ac5c386281126ba96410bc67d27e',

      // isEmailVerified: false
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserGood(uid));
    }).catchError((e) {
      emit(CreateUserBad(e.toString()));
    });
  }
}
