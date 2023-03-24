// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  String? text;
  IconData? icon;
  VoidCallback? callback;
  CardWidget({
    required this.icon,
    required this.text,
    required this.callback,

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff16797a),
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  child: CircleAvatar(
                    backgroundColor: const Color(0xffceecef),
                    child: IconButton(
                      onPressed: callback,
                      icon: Icon(icon!),
                      color: const Color(0xff16787c),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(text!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
