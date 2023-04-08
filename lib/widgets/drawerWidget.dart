import 'package:flutter/material.dart';
import 'package:todo_fir/Modules/addTask/addTask.dart';
import 'package:todo_fir/Modules/allUsers/allUser.dart';
import 'package:todo_fir/Modules/profile/profile.dart';
import 'package:todo_fir/Modules/task/tasks.dart';

import '../Shared/Components/component.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Flexible(child: Image.asset('assets/images/gdg.png')),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
        const SizedBox(
          height: 30,
        ),
        _listTiles(
            label: 'All tasks',
            fct: () {
              _navigateToTaskScreen(context);
            },
            icon: Icons.task_outlined),
        _listTiles(
            label: 'My account',
            fct: () {
              _navigateToProfileScreen(context);
            },
            icon: Icons.settings_outlined),
        _listTiles(
            label: 'Registered workes',
            fct: () {
              _navigateToAllUsersScreen(context);
            },
            icon: Icons.workspaces_outline),
        _listTiles(
            label: 'Add task',
            fct: () {
              _navigateToAddTaskScreen(context);
            },
            icon: Icons.add_task_outlined),
        const Divider(
          thickness: 1,
        ),
        _listTiles(
            label: 'Logout',
            fct: () {
              _logout(context);
            },
            icon: Icons.logout_outlined),
      ],
    ));
  }

  void _navigateToProfileScreen(context) {
    // final FirebaseAuth _auth = FirebaseAuth.instance;
    // final User? user = _auth.currentUser;
    // final uid = user!.uid;
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => ProfileScreen(
    //       userID: uid,
    //     ),
    //   ),
    // );
    navigatAndReturn(context: context, page: Profile());
  }

  void _navigateToAllUsersScreen(context) {
    navigatAndReturn(context: context, page: AllUsers());
  }

  void _navigateToAddTaskScreen(context) {
    navigatAndReturn(context: context, page: AddTask());
  }

  void _navigateToTaskScreen(context) {
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => TasksScreen(),
    //   ),
    // );
    navigatAndFinish(context: context, page: Tasks());
  }

  void _logout(context) {
    // final FirebaseAuth _auth = FirebaseAuth.instance;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Row(
              children: [
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.logout,
                      color: Colors.blue,
                    )),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Sign out'),
                ),
              ],
            ),
            content: const Text(
              'Do you wanna Sign out',
              style: TextStyle(
                  // color: Constants.darkBlue,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                  onPressed: () async {
                    // await _auth.signOut();
                    // Navigator.canPop(context) ? Navigator.pop(context) : null;
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(
                    //     builder: (ctx) => UserState(),
                    //   ),
                    // );
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          );
        });
  }

  Widget _listTiles(
      {required String label, required Function fct, required IconData icon}) {
    return ListTile(
      onTap: () {
        fct();
      },
      leading: Icon(
        icon,
        color: Colors.black38,
      ),
      title: Text(
        label,
        style: const TextStyle(
            color: Colors.black38, fontSize: 20, fontStyle: FontStyle.italic),
      ),
    );
  }
}
