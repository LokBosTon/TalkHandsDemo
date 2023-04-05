import 'package:flutter/material.dart';

class LearningMenuButton extends StatelessWidget {
  LearningMenuButton(this.child, this.image, this.name, {super.key});

  String name;
  Widget child;
  AssetImage image;

  void _onPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => child,
      ),
    );
  }

  TextStyle _textStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 190,
        child: InkWell(
          onTap: () => _onPressed(context),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: image,
                fit: BoxFit.fill,
                colorFilter: const ColorFilter.mode(
                  Colors.black26,
                  BlendMode.darken,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: _textStyle(),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.watch_later_outlined,
                          color: Colors.white),
                      Text(
                        ' 5 min',
                        style: _textStyle(),
                      ),
                      const Icon(Icons.favorite_border, color: Colors.white),
                      Text(
                        ' 15k',
                        style: _textStyle(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
