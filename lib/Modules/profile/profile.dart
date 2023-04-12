import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_fir/Shared/Components/component.dart';

import '../cubit/home_cubit.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            appBar: defaultAppBar(
                title: const Text('Profile'),
                canreturn: true,
                onPressed: () {
                  Navigator.pop(context);
                }),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9-6bTSqGzEDlxq6CbtlyAHvfr47PT5BpaGTi0nq4&s'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${HomeCubit.get(context).userModel!.name}',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'M1 Stic ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/github.png'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage('assets/images/messenger.png'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage('assets/images/linkedin.png'),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Descreption',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 6, 39, 56),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${HomeCubit.get(context).userModel!.bio}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    defaultSubmit2(
                      background: Colors.grey,
                      text: 'Logout',
                    )
                  ],
                ),
              ),
            ));
      },
    ));
  }
}
