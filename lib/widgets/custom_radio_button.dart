import 'package:flutter/material.dart';
import 'package:gptsample/utils/responsive_checker.dart';

class CustomRadioButtonGroup extends StatefulWidget {
  final void Function(int) selChange;

  const CustomRadioButtonGroup({super.key, required this.selChange});

  @override
  State<CustomRadioButtonGroup> createState() => _CustomRadioButtonGroupState();
}

class _CustomRadioButtonGroupState extends State<CustomRadioButtonGroup> {
  int value = 1;
  Widget customRadioButton(String text, int index) {
    return ElevatedButton(
      onPressed: () async {
        setState(() {
          value = index;
          debugPrint('$value');
        });
        widget.selChange(value);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: (value != index)
            ? const Color.fromRGBO(226, 229, 232, 1)
            : const Color.fromRGBO(128, 128, 217, 1),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: ResponsiveChecker.isMobile(context) ? 12 : 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          color: (value == index) ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: ResponsiveChecker.isMobile(context) ? 40 : 48,
          width: ResponsiveChecker.isMobile(context) ? 80 : 95.92,
          padding: const EdgeInsets.only(right: 8),
          child: customRadioButton("URLs", 1),
        ),
        Container(
          height: ResponsiveChecker.isMobile(context) ? 40 : 48,
          width: ResponsiveChecker.isMobile(context) ? 80 : 95.92,
          padding: const EdgeInsets.only(right: 8),
          child: customRadioButton("Files", 2),
        ),
        Container(
          height: ResponsiveChecker.isMobile(context) ? 40 : 48,
          width: ResponsiveChecker.isMobile(context) ? 80 : 95.92,
          padding: const EdgeInsets.only(right: 8),
          child: customRadioButton("Image", 3),
        ),
        Container(
          height: ResponsiveChecker.isMobile(context) ? 40 : 48,
          width: ResponsiveChecker.isMobile(context) ? 80 : 95.92,
          padding: const EdgeInsets.only(right: 8),
          child: customRadioButton("Q&A", 4),
        ),
        Container(
          height: ResponsiveChecker.isMobile(context) ? 40 : 48,
          width: ResponsiveChecker.isMobile(context) ? 80 : 95.92,
          padding: const EdgeInsets.only(right: 8),
          child: customRadioButton("Text", 5),
        ),
      ],
    );
  }
}
