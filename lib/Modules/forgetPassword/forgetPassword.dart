import 'package:flutter/material.dart';

import '../../Shared/Components/component.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final emailController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            const Text(
              'Forget password',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Email adress',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            defaultForm(
                controller: emailController,
                textInputAction: TextInputAction.done,
                label: 'Email',
                prefixIcon: const Icon(Icons.email),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email Must Be Not Empty";
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            defaultSubmit2(
              text: 'Reset now',
              onPressed: () {
                if (formkey.currentState!.validate()) {}
              },
            )
          ]),
        ),
      ),
    );
  }
}
