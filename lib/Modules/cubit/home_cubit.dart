import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int indexcategory = 1;
  final deadlineController = TextEditingController(
      text:
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ");

  DateTime date = DateTime.now();

  void changeIndexcategory(int index) {
    indexcategory = index;
    emit(ChangeIndexCategoryStateGood());
  }

  void changeDeadlineTask(DateTime date) {
    this.date = date;
    deadlineController.text = "${date.day}/${date.month}/${date.year}";
    emit(ChangeDeadlineCategoryStateGood());
  }
}
