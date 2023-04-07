import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Shared/Components/component.dart';
import 'cubit/register_cubit.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

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
                          // onFieldSubmitted: (value) {
                          //   if (formKey.currentState!.validate()) {}
                          // },
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
                          defaultSubmit1(formKey),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
