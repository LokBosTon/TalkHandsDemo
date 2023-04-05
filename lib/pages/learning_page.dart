import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:signier_demo/pages/alphabetpage.dart';
import 'package:signier_demo/widgets/learningmenubutton.dart';

import '../widgets/books.dart';
import '../widgets/dictionary.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({super.key});

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width, height: 70),
            const Text('Good Morning, User!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                )),
            const Text(
              'Let us understand each other more today!',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Expanded(
                  child: SizedBox(
                    height: 49,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search product',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Ink(
                  decoration: const ShapeDecoration(
                    color: Color(0xFF00A9B7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.manage_search),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  LearningMenuButton(
                    Alphabet(),
                    const AssetImage(
                        'assets/backgroundImages/ButtonBackground.png'),
                    'Alphabet',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LearningMenuButton(
                    Dictionary(),
                    const AssetImage('assets/backgroundImages/ButtonBack.png'),
                    'Dictionary',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LearningMenuButton(
                    const Books(),
                    const AssetImage('assets/backgroundImages/ButtonBack2.png'),
                    'Books',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
