import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: TextField(
          onSubmitted: (value) => debugPrint(value),
          expands: true,
          maxLines: null,
          textAlignVertical: TextAlignVertical.top,
          decoration: const InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              onPressed: null,
            ),
            hintText: 'Enter text here',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
