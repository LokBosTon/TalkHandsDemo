import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signier_demo/personalinformationpage.dart';

import 'profilepage.dart';

class MenuButton extends StatelessWidget {
  const MenuButton(this._text, this._icon, this._page, {super.key});
  final String _text;
  final IconData _icon;
  final Widget _page;

  void _onPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _page,
      ),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return CupertinoButton(
      onPressed: () => _onPressed(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF38A3A5),
                ),
                child: Icon(
                  _icon,
                  color: Colors.white,
                ),
              ),
              Text(
                _text,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Icon(Icons.chevron_right, color: Colors.black)
        ],
      ),
    );
  }
}
