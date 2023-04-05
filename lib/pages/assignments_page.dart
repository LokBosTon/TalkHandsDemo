import 'package:flutter/material.dart';
import '../widgets/exercisewidget.dart';
import 'questionpage.dart';

class AssignmentsPage extends StatefulWidget {
  const AssignmentsPage({super.key});

  @override
  State<AssignmentsPage> createState() => _AssignmentsPageState();
}

class _AssignmentsPageState extends State<AssignmentsPage> {
  final TextStyle _textStyle = const TextStyle(
    fontSize: 20,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60),
        Text('Exercises',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        Container(
          margin: EdgeInsets.all(20),
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.cyan,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFF00B4DB),
                Color(0xFF0083B0),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Score',
                      style: _textStyle,
                    ),
                    Text(
                      '1000',
                      style: _textStyle,
                    ),
                  ],
                ),
                Container(
                  width: 1,
                  color: Colors.white,
                ),
                Column(
                  children: [
                    Text(
                      'Rank',
                      style: _textStyle,
                    ),
                    Text(
                      '1000',
                      style: _textStyle,
                    ),
                  ],
                ),
                Container(
                  width: 1,
                  color: Colors.white,
                ),
                Column(
                  children: [
                    Text(
                      'Completed Last',
                      style: _textStyle,
                    ),
                    Text(
                      '1000',
                      style: _textStyle,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        ExerciseMenuTile('1', 'Test1', '100%', 'Completed', () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => QuestionPage('Test1')));
        }),
        ExerciseMenuTile('2', 'Test2', '50%', 'In Progress', () {}),
        ExerciseMenuTile('3', 'Test3', '0%', 'Not Started', () {}),
        ExerciseMenuTile('4', 'Test4', '0%', 'Not Started', () {}),
      ],
    );
  }
}
