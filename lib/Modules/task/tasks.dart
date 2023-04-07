import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_fir/Modules/cubit/home_cubit.dart';
import 'package:todo_fir/Shared/Components/component.dart';

import '../../Shared/Components/constante.dart';
import '../../widgets/drawerWidget.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          drawer: const DrawerWidget(),
          appBar: defaultAppBar(
            actions: [
              IconButton(
                onPressed: () {
                  showTaskCategoryDialog(context, size);
                },
                icon: const Icon(
                  Icons.filter_list_outlined,
                  color: Colors.black,
                ),
              ),
            ],
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ));
              },
            ),
            title: const Text('Tasks'),
            canreturn: false,
          ),
          body: ListView.builder(
              itemBuilder: (context, index) => defaultTask(context),
              itemCount: 10),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}

Widget defaultTask(context) => Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => TaskDetails(
          //       taskId: widget.taskId,
          //       uploadedBy: widget.uploadedBy,
          //     ),
          //   ),
          // );
        },
        onLongPress: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actions: [
                    TextButton(
                        onPressed: () {
                          // User? user = _auth.currentUser;
                          // String _uid = user!.uid;
                          // if (_uid == widget.uploadedBy) {
                          //   FirebaseFirestore.instance
                          //       .collection('tasks')
                          //       .doc(widget.taskId)
                          //       .delete();
                          //   Navigator.pop(context);
                          // } else {
                          //   GlobalMethods.showErrorDialog(
                          //       error:
                          //           'You dont have access to delete this task',
                          //       context: context);
                          // }
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            )
                          ],
                        ))
                  ],
                );
              });
        },
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: const EdgeInsets.only(right: 12.0),
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(width: 1.0),
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius:
                20, // https://image.flaticon.com/icons/png/128/850/850960.png
            child: Image.asset(
              true
                  ? 'assets/images/done2.png'
                  : 'https://image.flaticon.com/icons/png/128/850/850960.png',
            ),
          ),
        ),
        title: const Text(
          'Title',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.linear_scale,
              color: Colors.pink.shade800,
            ),
            const Text(
              'Description',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          size: 30,
          color: Colors.pink[800],
        ),
      ),
    );

void showTaskCategoryDialog(context, size) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Task category',
            style: TextStyle(color: Colors.pink.shade300, fontSize: 20),
          ),
          content: SizedBox(
            width: size.width * 0.9,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: taskCategoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      print(
                          'taskCategoryList[index] ${taskCategoryList[index]}');
                      HomeCubit.get(context).changeIndexcategory(index);
                      // setState(() {
                      //   taksCategory = Constants.taskCategoryList[index];
                      // });
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_rounded,
                          color: Colors.red[200],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            taskCategoryList[index],
                            style: const TextStyle(
                                color: Color(0xFF00325A),
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      });
}
