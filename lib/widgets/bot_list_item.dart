import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gptsample/models/menu_items.dart';
import 'package:gptsample/screen/botlist/botlist.dart';
import 'package:gptsample/widgets/common_widgets.dart';
import 'package:gptsample/widgets/menu_items.dart';

class BotListItem extends StatelessWidget {
  final String text;
  final String icon;
  Color colors;
  BotListItem(
      {super.key,
      required this.text,
      required this.icon,
      this.colors = Colors.deepPurpleAccent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
            color: colors,
          ),
          horizontalSpace(16),
          Expanded(
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          //const Spacer(),
          text != 'Root' ? buildMoreOptions(context) : Container()
        ],
      ),
    );
  }

  buildMoreOptions(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: const SizedBox(
          height: 48,
          width: 20,
          // padding: EdgeInsets.only(bottom: 14, left: 20, top: 13),
          child: Icon(
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
            color: const Color.fromRGBO(0, 0, 0, 0),
            // color: Colors.red,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          width: 178,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(255, 255, 255, 1),
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
    );
  }
}
