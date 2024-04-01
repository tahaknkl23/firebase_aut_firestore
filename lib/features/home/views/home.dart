import 'package:firebase_project/common/colors.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Merhaba Taha",
              style: TextStyle(fontSize: 20, color: titleColor),
            ),
          )
        ],
      ),
    );
  }
}
