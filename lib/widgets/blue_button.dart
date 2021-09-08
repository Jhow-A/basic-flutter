import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color;
  const BlueButton(this.text, {Key? key, required this.onPressed, this.color = Colors.blue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}