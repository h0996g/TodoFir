import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/Components/constante.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int indexcategory = 1;
  final categoryController = TextEditingController(text: taskCategoryList[0]);

  final deadlineController = TextEditingController(
      text:
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ");

  DateTime date = DateTime.now();

  void changecategoryController(int index) {
    // indexcategory = index;
    categoryController.text = taskCategoryList[index];
    emit(ChangeIndexCategoryStateGood());
  }

  void changeDeadlineTask(DateTime date) {
    this.date = date;
    deadlineController.text = "${date.day}/${date.month}/${date.year}";
    emit(ChangeDeadlineCategoryStateGood());
  }
}
