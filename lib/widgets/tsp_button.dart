import 'package:flutter/material.dart';

class TspButton extends StatelessWidget {
  final String text;
  const TspButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 77.3,
      height: 40,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31),
          ),
          side: const BorderSide(color: Color.fromRGBO(96, 97, 207, 1), width: 1.0),
        ),
        onPressed: () {
          debugPrint('Received click');
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(96, 97, 207, 1),
          ),
        ),
      ),
    );
  }
}
