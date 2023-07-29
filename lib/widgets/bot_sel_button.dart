import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:gptsample/widgets/menu_items.dart';
import 'package:gptsample/models/menu_items.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BotSelButton extends StatefulWidget {
  late String text;
  final SvgPicture icon;
  BotSelButton({super.key, required this.text, required this.icon});
  @override
  State<BotSelButton> createState() => _BotSelButtonState();
}

class _BotSelButtonState extends State<BotSelButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(168, 48),
          backgroundColor: Color.fromRGBO(245, 247, 249, 1),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        child: Container(
          child: Row(
            children: [
              // SizedBox(width: 20),
              Container(
                width: 24,
                height: 24,
                child: widget.icon,
                // color: Color.fromRGBO(48, 127, 201, 1),
              ),
              SizedBox(width: 19),
              Container(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 130),

              widget.text != 'Root'
                  ? Container(
                      child: CustomButtonTest(),
                    )
                  : Container(),
            ],
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}

class CustomButtonTest extends StatefulWidget {
  CustomButtonTest({super.key});
  @override
  State<CustomButtonTest> createState() => _CustomButtonTestState();
}

class _CustomButtonTestState extends State<CustomButtonTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton: Container(
              height: 48,
              width: 20,
              // padding: EdgeInsets.only(bottom: 14, left: 20, top: 13),
              child: const Icon(
                Icons.more_vert,
                color: Color.fromRGBO(153, 157, 161, 1),
              ),
            ),
            items: [
              ...MenuItems.firstItems.map(
                (item) => DropdownMenuItem<MenuItem>(
                  value: item,
                  child: MenuItems.buildItem(item),
                ),
              ),
            ],
            onChanged: (value) {
              MenuItems.onChanged(context, value as MenuItem);
            },
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                  // color: Colors.red,
                ),
                color: Color.fromRGBO(0, 0, 0, 0),
                // color: Colors.red,
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              width: 178,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              elevation: 8,
              offset: const Offset(0, 0),
            ),
            menuItemStyleData: MenuItemStyleData(
              customHeights: [
                ...List<double>.filled(MenuItems.firstItems.length, 48),
              ],
              padding: const EdgeInsets.only(left: 16, right: 16),
            ),
          ),
        ),
      ),
    );
  }
}
