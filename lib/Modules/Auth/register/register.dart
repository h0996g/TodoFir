import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_fir/Modules/cubit/home_cubit.dart';
import 'package:todo_fir/Modules/task/tasks.dart';
import '../../../Shared/Components/component.dart';
import '../../../Shared/Components/constante.dart';
import '../../../Shared/helper/chashHelper.dart';
import 'cubit/register_cubit.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<RegisterCubit, RegisterState>(
      builder: (BuildContext context, state) {
        RegisterCubit _RegisterCubit = BlocProvider.of(context);

        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                      const Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      defaultForm(
                        prefixIcon: const Icon(Icons.business),
                        onTap: () {
                          showDepartementDialog(context, size);
                        },
                        // controller: HomeCubit.get(context).deadlineController,
                        textInputAction: TextInputAction.none,
                        validator: () {},
                        controller: RegisterCubit.get(context).depController,
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultForm(
                          type: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          label: 'Email',
                          prefixIcon: const Icon(Icons.email),
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email Must Be Not Empty";
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultForm(
                          controller: nameController,
                          type: TextInputType.text,
                          label: 'Name',
                          textInputAction: TextInputAction.next,
                          prefixIcon: const Icon(Icons.person),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name Must Be Not Empty";
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultForm(
                          textInputAction: TextInputAction.next,
                          label: "Phone",
                          controller: phoneController,
                          type: TextInputType.phone,
                          prefixIcon: const Icon(Icons.phone),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Phone Must Be Not Empty";
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultForm(
                          suffixIcon: IconButton(
                              onPressed: () {
                                _RegisterCubit.showPassword();
                              },
                              icon: _RegisterCubit.isvisibility
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                          controller: passwordController,
                          textInputAction: TextInputAction.done,
                          prefixIcon: const Icon(Icons.password),
                          obscureText: !_RegisterCubit.isvisibility,
                          label: "Password",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password Must Be Not Empty";
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text('Have an account'),
                          const SizedBox(
                            width: 5,
                          ),
                          TextButton(
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.blue),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Spacer(),
                          ConditionalBuilder(
                            builder: (BuildContext context) {
                              return defaultSubmit1(
                                  formKey: formKey,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      RegisterCubit.get(context).register(
                                        email: emailController.text,
                                        name: nameController.text,
                                        password: passwordController.text,
                                        phone: phoneController.text,
                                      );
                                    }
                                  });
                            },
                            condition: state is! LodinRegisterState,
                            fallback: (BuildContext context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {
        if (state is CreateUserGood) {
          showToast(msg: "Succesffuly", state: ToastStates.success);
          // sleep(const Duration(seconds: 1));
          CachHelper.putcache(key: 'uid', value: state.uid).then((value) {
            UID = CachHelper.getData(key: 'uid');
            navigatAndFinish(context: context, page: Tasks());
          });
        } else if (state is CreateUserWithEmailAndPasswordBad) {
          showToast(msg: state.error, state: ToastStates.error);
        }
      },
    );
  }
}

void showDepartementDialog(context, size) {
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
                itemCount: departementList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      print(
                          'taskCategoryList[index] ${departementList[index]}');
                      RegisterCubit.get(context).changeDepartementTask(index);
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
                            departementList[index],
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
