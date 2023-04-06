import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_fir/Modules/login/cubit/login_cubit.dart';
import 'package:todo_fir/Shared/Components/component.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (BuildContext context, state) {
        LoginCubit _loginCubit = BlocProvider.of(context);

        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      defaultForm(
                          controler: emailController,
                          textInputAction: TextInputAction.next,
                          labels: 'Email',
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
                          controler: passController,
                          textInputAction: TextInputAction.done,
                          prefixIcon: const Icon(Icons.password),
                          obscureText: !_loginCubit.isvisibility,
                          labels: "Password",
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
                          const Text('forget password ?'),
                          const Spacer(),
                          FloatingActionButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {}
                            },
                            child: const Icon(Icons.arrow_forward_ios),
                          )
                        ],
                      ),
                      Center(
                        child: TextButton(
                          child: const Text('Register Now '),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
