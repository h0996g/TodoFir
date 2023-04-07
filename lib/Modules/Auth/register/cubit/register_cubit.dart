import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  bool isvisibility = false;

  void showPassword() {
    isvisibility = !isvisibility;
    emit(ShowPasswordState());
  }
}
