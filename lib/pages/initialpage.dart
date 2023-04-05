// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:signier_demo/appmain.dart';
import 'package:signier_demo/loginpage.dart';
import 'package:signier_demo/registerpage.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    void _onPressed(BuildContext context, Widget _page) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => _page,
        ),
      );
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/login_background.jpg',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Signier',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'LifeSavers',
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 309,
              child: ElevatedButton(
                onPressed: () => _onPressed(context, LoginPage()),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFF22577A),
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 50,
                width: 309,
                child: ElevatedButton(
                    onPressed: () => _onPressed(context, RegisterPage()),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF22577A)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: TextButton(
                  onPressed: () => _onPressed(context, MainPage()),
                  child: Text('Skip for now',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
