import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/userModel.dart';
import '../../Shared/Components/constante.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  bool isDone = false;
  bool iswriteComment = false;
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

  void changeStateDone(bool state) {
    isDone = state;
    emit(ChangeStatDoneStateGood());
  }

  void writeComment(bool state) {
    iswriteComment = state;
    emit(ChangeAnimatCommentStateGood());
  }

  UserModel? userModel;
  void getUserData() {
    emit(LodinGetUserDataState());
    FirebaseFirestore.instance.collection('users').doc(UID).get().then((value) {
      print(value.data());
      userModel = UserModel.fromJson(value.data()!);
      // print(_userModel);
      emit(GetUserDataStateGood());
    }).catchError((e) {
      emit(GetUserDataStateBad(e.toString()));
    });
  }

// !add post
  // Future<void> addTask({
  //   required String text,
  // }) async {
  //   emit(LodingAddTaskState());

  //   TaskModel model = TaskModel(
  //       uid: userModel!.uid,
  //       dateTime: DateTime.now().toString(),
  //       category: ,
  //       description: ,
  //       title: ,

  //       );
  //   await FirebaseFirestore.instance
  //       .collection('posts')
  //       .add(model.toMap())
  //       .then((value) {
  //     getPosts();
  //     emit(AddTaskStateGood());
  //   }).catchError((e) {
  //     emit(AddTaskStateBad());
  //   });
  // }
  // !--------------------
}
