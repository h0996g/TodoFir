import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_fir/Modules/cubit/home_cubit.dart';
import 'package:todo_fir/Shared/Components/component.dart';

class TaskDetails extends StatelessWidget {
  TaskDetails({super.key});
  final commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(
              title: const Text('Task Details'),
              canreturn: true,
              onPressed: () {
                Navigator.pop(context);
              }),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9-6bTSqGzEDlxq6CbtlyAHvfr47PT5BpaGTi0nq4&s'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Guechi',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Text('HoussemEddine', style: TextStyle(fontSize: 20))
                        ],
                      ),
                      Spacer()
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text('Date Created',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        '01/09/2023',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text('Final Date     ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        '01/11/2023',
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                    child: Text(
                      'Still Time',
                      style: TextStyle(fontSize: 25, color: Colors.green),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Description :',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                              '1 Intro 2 Why LaTeX is great for writing a thesis 3 My favorite LaTeX editors Overleaf.com 4 Folders, Projects, and Templates'),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('State :',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          HomeCubit.get(context).changeStateDone(true);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Done',
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  color: HomeCubit.get(context).isDone
                                      ? Colors.green
                                      : Colors.black12),
                            ),
                            if (HomeCubit.get(context).isDone)
                              const CircleAvatar(
                                backgroundColor: Colors.transparent,
                                // minRadius: double.minPositive,
                                backgroundImage:
                                    AssetImage('assets/images/done1.png'),
                              )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          HomeCubit.get(context).changeStateDone(false);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (!HomeCubit.get(context).isDone)
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/cancel.png'),
                              ),
                            Text(
                              'Not yet',
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  color: !HomeCubit.get(context).isDone
                                      ? Colors.red
                                      : Colors.black12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeCubit.get(context).iswriteComment
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: defaultForm(
                                  controller: commentController,
                                  textInputAction: TextInputAction.done,
                                  validator: () {},
                                  maxLines: 5,
                                  maxLength: 40),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MaterialButton(
                                  color: Colors.grey,
                                  onPressed: () {},
                                  child: const Text(
                                    'Add',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      HomeCubit.get(context)
                                          .writeComment(false);
                                    },
                                    child: const Text('Cancel'))
                              ],
                            )
                          ],
                        )
                      : defaultSubmit2(
                          text: 'Add Comment',
                          background: Colors.grey,
                          onPressed: () {
                            HomeCubit.get(context).writeComment(true);
                          }),
                  // defaultSubmit2(
                  //   text: 'Add Commante',
                  //   background: Colors.grey,
                  // ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => defaultComment(context),
                    itemCount: 10,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget defaultComment(context) => Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
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
            child: Image.network(
              true
                  ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9-6bTSqGzEDlxq6CbtlyAHvfr47PT5BpaGTi0nq4&s'
                  : 'https://image.flaticon.com/icons/png/128/850/850960.png',
            ),
          ),
        ),
        title: const Text(
          'HoussemEddine Guechi',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text(
          'Commant bla bla doCommant bla bla doCommant bla bla doCommant bla bla do ',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
