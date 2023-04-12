import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_fir/Modules/forgetPassword/forgetPassword.dart';
import 'package:todo_fir/Modules/task/tasks.dart';
import 'package:todo_fir/Shared/Components/component.dart';
import '../../../Shared/Components/constante.dart';
import '../../../Shared/helper/chashHelper.dart';
import '../register/register.dart';
import 'cubit/login_cubit.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (BuildContext context, state) {
        LoginCubit _loginCubit = BlocProvider.of(context);

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
                      height: size.height * 0.3,
                    ),
                    const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    defaultForm(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        label: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email Must Be Not Empty";
                          }
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    defaultForm(
                        onFieldSubmitted: (value) {
                          if (formKey.currentState!.validate()) {}
                        },
                        suffixIcon: IconButton(
                            onPressed: () {
                              _loginCubit.showPassword();
                            },
                            icon: _loginCubit.isvisibility
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                        controller: passwordController,
                        textInputAction: TextInputAction.done,
                        prefixIcon: const Icon(Icons.password),
                        obscureText: !_loginCubit.isvisibility,
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
                        TextButton(
                            onPressed: () {
                              navigatAndReturn(
                                  context: context, page: ForgetPassword());
                            },
                            child: const Text('forget password ?')),
                        const Spacer(),
                        ConditionalBuilder(
                          builder: (BuildContext context) {
                            return defaultSubmit1(
                                formKey: formKey,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    _loginCubit.login(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                });
                          },
                          condition: state is! LodinLoginState,
                          fallback: (BuildContext context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        )
                      ],
                    ),
                    Center(
                      child: TextButton(
                        child: const Text('Register Now '),
                        onPressed: () {
                          navigatAndReturn(context: context, page: Register());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {
        if (state is SignInWithEmailAndPasswordGood) {
          // await Fluttertoast.showToast(
          //     msg: "Success Login",
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.BOTTOM,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.green,
          //     textColor: Colors.white,
          //     fontSize: 16.0);
          showToast(msg: "Login Successful", state: ToastStates.success);
          // sleep(const Duration(seconds: 1));
          CachHelper.putcache(key: "uid", value: state.uid).then((value) {
            print(value.toString());
            UID = CachHelper.getData(key: 'uid');

            // HomeCubit.get(context).getUserData();
            // HomeCubit.get(context).getPosts();

            navigatAndFinish(context: context, page: Tasks());
          });
        } else if (state is SignInWithEmailAndPasswordBad) {
          showToast(msg: state.error, state: ToastStates.error);
        }
      },
    );
  }
}
