import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
}
