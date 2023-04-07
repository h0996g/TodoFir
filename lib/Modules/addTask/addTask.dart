import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_fir/Shared/Components/component.dart';

import '../../Shared/Components/constante.dart';
import '../cubit/home_cubit.dart';
import '../task/tasks.dart';

class AddTask extends StatelessWidget {
  final categoryController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  // deadlineController raho fl CubitHome

  AddTask({super.key});
  // DateTime? date;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(
              title: const Text('Add Task'),
              onPressed: () {
                Navigator.pop(context);
              }),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultTextTitle(text: 'Task category'),
                    const SizedBox(
                      height: 10,
                    ),
                    defaultForm(
                      hintText: taskCategoryList[
                          HomeCubit.get(context).indexcategory],
                      readOnly: true,
                      onTap: () {
                        showTaskCategoryDialog(context, size);
                      },
                      controller: categoryController,
                      textInputAction: TextInputAction.next,
                      validator: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultTextTitle(text: 'Task title'),
                    const SizedBox(
                      height: 10,
                    ),
                    defaultForm(
                      controller: titleController,
                      textInputAction: TextInputAction.next,
                      validator: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultTextTitle(text: 'Task Description'),
                    const SizedBox(
                      height: 10,
                    ),
                    defaultForm(
                      maxLength: 1000,
                      maxLines: 5,
                      controller: descriptionController,
                      textInputAction: TextInputAction.done,
                      validator: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultTextTitle(text: 'Task Deadline Date'),
                    const SizedBox(
                      height: 10,
                    ),
                    defaultForm(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 0)),
                                lastDate: DateTime(2400))
                            .then((value) {
                          HomeCubit.get(context).changeDeadlineTask(value!);
                        }).catchError((e) {});
                      },
                      controller: HomeCubit.get(context).deadlineController,
                      textInputAction: TextInputAction.done,
                      validator: () {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    defaultSubmit2(
                      text: 'Add Task',
                      isUpperCase: false,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

defaultTextTitle({required String text}) => Text(
      text,
      style: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 55, 11, 1)),
    );
