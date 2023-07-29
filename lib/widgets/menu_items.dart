import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gptsample/models/menu_items.dart';

class MenuItems {
  static const List<MenuItem> firstItems = [duplicate, rename, delete];

  static const duplicate =
      MenuItem(text: 'Duplicate', icon: Icons.filter_none_outlined);
  static const rename = MenuItem(text: 'Rename', icon: Icons.flip_outlined);
  static const delete = MenuItem(text: 'Delete', icon: Icons.cancel_outlined);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        const SizedBox(width: 4),
        SizedBox(
          width: 20,
          height: 20,
          child: item.text == 'Duplicate'
              ? SvgPicture.asset(
                  'assets/images/Icons/Vector-3(1).svg',
                  // color: Color.fromRGBO(48, 127, 201, 1),
                )
              : item.text == 'Rename'
                  ? SvgPicture.asset(
                      'assets/images/Icons/Group-1.svg',
                      // color: Color.fromRGBO(129, 129, 129, 1),
                    )
                  : SvgPicture.asset(
                      'assets/images/Icons/Group.svg',
                      // color: Color.fromRGBO(15, 12, 12, 1),
                    ),
        ),
        const SizedBox(width: 24),
        Text(
          item.text,
          style: const TextStyle(
            color: Color.fromRGBO(97, 97, 97, 1),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.duplicate:
        break;
      case MenuItems.rename:
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) => AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              width: 363,
              height: 240,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.zero,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Color(0xffb7babd),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: const Text(
                        'Bot name',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: const TextField(
                      autofocus: true,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Align(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(31),
                            ),
                            side: BorderSide.none,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              color: Color.fromRGBO(96, 97, 207, 1),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(96, 97, 207, 1),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            minimumSize: const Size(102, 40),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Confirm',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.617143,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          barrierColor: Colors.white.withOpacity(0.7),
        );
        break;
      case MenuItems.delete:
        break;
    }
  }
}
