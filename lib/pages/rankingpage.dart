import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RankingPage extends StatelessWidget {
  RankingPage({super.key});

  List<String> names = [
    'Catherine Walters',
    'Kamil Velasquez',
    'Raphael Coffey',
    'Anas Tyler',
    'Hayley Rodriguez',
    'Bella Cochran',
    'Moses Waters',
  ];

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
              ))),
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
          'Ranking',
          style: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xFF38A3A5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: const [
                  Positioned(
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profileimage.png'),
                      radius: 70,
                    ),
                    top: 70,
                  ),
                  Positioned(
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profileimage.png'),
                      radius: 50,
                    ),
                    top: 150,
                    right: 20,
                  ),
                  Positioned(
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profileimage.png'),
                      radius: 50,
                    ),
                    top: 150,
                    left: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    (index + 1).toString(),
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/profileimage.png'),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    names[index],
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '1500',
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }
}
