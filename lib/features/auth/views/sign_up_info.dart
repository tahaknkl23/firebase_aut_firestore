import 'package:firebase_project/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpInfo extends StatefulWidget {
  const SignUpInfo({super.key});

  @override
  State<SignUpInfo> createState() => _SignUpInfoState();
}

class _SignUpInfoState extends State<SignUpInfo> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _usernameController.dispose();

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
                          controller: _nameController,
                          validator: (value) => value!.isEmpty ? 'Please enter name' : null,
                          decoration: InputDecoration(
                            fillColor: containerColor,
                            filled: true,
                            labelText: 'Name',
                            labelStyle: const TextStyle(color: titleColor),
                            border: OutlineInputBorder(borderSide: const BorderSide(color: containerColor), borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          controller: _surnameController,
                          validator: (value) => value!.isEmpty ? 'Please enter surname' : null,
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: containerColor,
                            filled: true,
                            labelStyle: const TextStyle(color: titleColor),
                            labelText: 'Surname',
                            border: OutlineInputBorder(borderSide: const BorderSide(color: borderColor), borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          controller: _usernameController,
                          validator: (value) => value!.isEmpty ? 'Please enter username' : null,
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: containerColor,
                            filled: true,
                            labelStyle: const TextStyle(color: titleColor),
                            labelText: 'Username',
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
                                if (_formKey.currentState!.validate()) {}
                              },
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              minWidth: double.infinity,
                              color: buttonColor,
                              child: const Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Text("Sign Up")),
                            ),
                          );
                        },
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
