import 'package:flutter/material.dart';

class FileNameWidget extends StatelessWidget {
  const FileNameWidget(
      {super.key,
      required this.text,
      required this.index,
      required this.onRemove});

  final String text;
  final int index;
  final void Function(int) onRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FittedBox(
          child: Container(
            padding: const EdgeInsets.only(top: 2, bottom: 2),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
              color: Color(0xfffff1d3),
            ),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 13),
                Text(
                  text,
                  style: const TextStyle(
                    // color: Color.fromRGBO(97, 97, 97, 1),
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1,
                    fontSize: 12,
                  ),
                ),
                // Expanded(
                Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      onRemove(index);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
