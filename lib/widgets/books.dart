import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Books extends StatelessWidget {
  const Books({super.key});

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
          'Books',
          style: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Book(
            const Image(
              image: AssetImage('assets/books/Book1.jpg'),
            ),
            'ASL for Beginners: ' +
                '\n' +
                'Learn Signing' +
                '\n' +
                'Essentials in 30 Days',
            'Rochelle Barlow',
          ),
          Book(
              const Image(
                image: AssetImage('assets/books/Book2.jpg'),
              ),
              'The Everything Sign' +
                  '\n' +
                  'Language Book:' +
                  '\n' +
                  'ASL Made Easy',
              'Irene Duke'),
          Book(
              const Image(
                image: AssetImage('assets/books/Book3.jpg'),
              ),
              'American Sign Language' + '\n' + 'for dummies',
              'Adan R. Penilla II'),
          Book(
            const Image(
              image: AssetImage('assets/books/Book4.jpg'),
            ),
            'Learn ASL: ' +
                '\n' +
                'Everything You Need' +
                '\n' +
                'to Start Signing',
            'Rochelle Barlow',
          ),
          Book(
              const Image(
                image: AssetImage('assets/books/Book5.jpg'),
              ),
              'We Can Sign!: ' +
                  '\n' +
                  'An Essential Illustrated' +
                  '\n' +
                  'Guide to ASL for Kids',
              'Tara Adams'),
        ],
      ),
    );
  }
}

class Book extends StatelessWidget {
  Book(this.image, this.name, this.author, {super.key});
  Image image;
  String name;
  String author;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.cyan),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        width: MediaQuery.of(context).size.width,
        height: 140,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(aspectRatio: 1, child: image),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  softWrap: true,
                ),
                Text(
                  author,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
