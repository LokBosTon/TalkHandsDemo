import 'package:flutter/material.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          width: MediaQuery.of(context).size.width * 0.8,
          height: 53,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF38A3A5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Enter Exam',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
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
          title: Text(
            'Progress',
            style: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Positioned(
              top: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: Center(
                          child: Text(
                            'Ongoing',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF38A3A5),
                        ),
                        child: Center(
                          child: Text(
                            'Completed',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            CompletionEntry(),
            CompletionEntry(),
            CompletionEntry(),
            CompletionEntry(),
          ],
        ));
  }
}

class CompletionEntry extends StatelessWidget {
  const CompletionEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Test 1',
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0xFF57CC99),
                      ),
                      Text(
                        '24/24 Completed',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                width: 80,
                height: 40,
                color: Colors.white,
                child: Stack(
                  children: const <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: Text(
                              '+17',
                              style: TextStyle(fontSize: 15),
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
