// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:signier_demo/appstylebutton.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left, color: Colors.black),
        ),
        title: const Text(
          'Personal Information',
          style: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey,
                    backgroundImage:
                        AssetImage('assets/images/profileimage.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            NameSection(
              text1: 'Your Name',
              text2: 'Katherina Petrova',
            ),
            const SizedBox(
              height: 20,
            ),
            NameSection(
              text1: 'Phone Number',
              text2: '+994 555 55 55 55',
            ),
            const SizedBox(
              height: 20,
            ),
            NameSection(
              text1: 'Email',
              text2: 'katherina1@gmail.com',
            ),
            const SizedBox(
              height: 20,
            ),
            NameSection(
              text1: 'Birth Date',
              text2: '24 December 1998',
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              width: 309,
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: AppStyleButton(
                text: 'Update',
                color: Color(0xFF38A3A5),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NameSection extends StatelessWidget {
  NameSection({
    required this.text1,
    required this.text2,
    super.key,
  });
  String text1;
  String text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        alignment: Alignment.bottomLeft,
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                text2,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
