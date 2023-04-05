// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:signier_demo/registerdetails.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, clipBehavior: Clip.none, children: [
        Positioned(
          top: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: FractionalOffset.topCenter,
                image: AssetImage(
                  'assets/images/login_background.jpg',
                ),
                colorFilter: ColorFilter.mode(
                  Colors.black12,
                  BlendMode.darken,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80),
              ),
            ),
            child: RegisterDetails(),
          ),
        ),
      ]),
    );
  }
}
