import 'package:flutter/material.dart';
import 'package:signier_demo/firebase_options.dart';
import 'package:signier_demo/pages/authpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signier_demo/pages/responsepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthPage(),
      theme: ThemeData(fontFamily: 'Nunito'),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
    );
  }
}
