import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gptsample/models/train_menu_item.dart';

class TrainMenuItems {
  static const List<TrainMenuItem> firstItems = [duplicate, rename, delete];

  static const duplicate = TrainMenuItem(text: 'Re-Sync');
  static const rename = TrainMenuItem(text: 'Visibility');
  static const delete = TrainMenuItem(text: 'Remove');

  // TrainMenuItem(text: 'Remove', icon: icon)

  static Widget buildItem(TrainMenuItem item) {
    return Row(
      children: [
        const SizedBox(width: 24),
        Text(
          item.text,
          style: const TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(right: 39),
            child: SizedBox(
              width: 20,
              height: 20,
              child: item.text == 'Re-Sync'
                  ? SvgPicture.asset(
                      'assets/images/Icons/Group-10.svg',
                      color: const Color.fromRGBO(48, 127, 201, 1),
                    )
                  : item.text == 'Visibility'
                      ? SvgPicture.asset(
                          'assets/images/Icons/Group178.svg',
                          // color: Color.fromRGBO(129, 129, 129, 1),
                        )
                      : SvgPicture.asset(
                          'assets/images/Icons/Group-9.svg',
                          color: const Color.fromRGBO(207, 80, 80, 1),
                        ),
            ),
            // Icon(item.icon, color: Color.fromRGBO(97, 97, 97, 1), size: 22),
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, TrainMenuItem item) {
    switch (item) {
      case TrainMenuItems.duplicate:
        break;
      case TrainMenuItems.rename:
        break;
      case TrainMenuItems.delete:
        break;
    }
  }
}
