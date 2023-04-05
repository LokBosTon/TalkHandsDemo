import 'package:flutter/material.dart';
import 'package:signier_demo/helpcentrepage.dart';
import 'package:signier_demo/logoutbutton.dart';
import 'package:signier_demo/menubutton.dart';
import 'package:signier_demo/pages/progresspage.dart';
import 'package:signier_demo/pages/rankingpage.dart';
import 'package:signier_demo/personalinformationpage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFcfe5e5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //profile picture
          const CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('assets/images/profileimage.png'),
          ),
          const Text(
            'Katherina Ivanova',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  MenuButton('Personal Information', Icons.person,
                      PersonalInformation()),
                  MenuButton(
                      'Course progress', Icons.assignment, ProgressPage()),
                  MenuButton('Ranking', Icons.notifications, RankingPage()),
                  MenuButton('About us', Icons.info, Placeholder()),
                  MenuButton('Help centre/Feedback', Icons.info, HelpCenter()),
                  LogoutButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
