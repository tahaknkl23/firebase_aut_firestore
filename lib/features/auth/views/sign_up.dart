import 'package:firebase_project/common/colors.dart';
import 'package:firebase_project/features/auth/repository/auth_repository.dart';
import 'package:firebase_project/features/auth/views/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/arkaplantwo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: containerbackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: containerColor,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) => value!.isEmpty ? 'Please enter email' : null,
                          decoration: InputDecoration(
                            fillColor: containerColor,
                            filled: true,
                            labelText: 'Email',
                            labelStyle: const TextStyle(color: titleColor),
                            border: OutlineInputBorder(borderSide: const BorderSide(color: containerColor), borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (value) => value!.isEmpty ? 'Please enter password' : null,
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: containerColor,
                            filled: true,
                            labelStyle: const TextStyle(color: titleColor),
                            labelText: 'Password',
                            border: OutlineInputBorder(borderSide: const BorderSide(color: borderColor), borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ref.read(auttControllerProvider).signUpWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      ).then((value) => Navigator.pop(context));
                                }
                              },
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              minWidth: double.infinity,
                              color: buttonColor,
                              child: const Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Text("Sign Up")),
                            ),
                          );
                        },
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Do you have an account ?",
                                    style: TextStyle(color: containerColor, fontSize: 16),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SignIn()));
                                  },
                                  child: const Text(
                                    " Sign in",
                                    style: TextStyle(color: buttonColor, fontSize: 16),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
