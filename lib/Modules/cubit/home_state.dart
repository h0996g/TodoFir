part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeIndexCategoryStateGood extends HomeState {}

class ChangeDeadlineCategoryStateGood extends HomeState {}

class ChangeStatDoneStateGood extends HomeState {}

class ChangeAnimatCommentStateGood extends HomeState {}

class LodinGetUserDataState extends HomeState {}

class GetUserDataStateGood extends HomeState {}

class GetUserDataStateBad extends HomeState {
  final err;

  GetUserDataStateBad(this.err);
}

class LodingAddTaskState extends HomeState {}

class AddTaskStateGood extends HomeState {}

class AddTaskStateBad extends HomeState {}
