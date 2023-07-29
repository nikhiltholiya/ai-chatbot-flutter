import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gptsample/models/train_menu_item.dart';
import 'package:gptsample/widgets/train_menu_items.dart';

class TrainListButton extends StatefulWidget {
  const TrainListButton({Key? key}) : super(key: key);

  @override
  State<TrainListButton> createState() => _TrainListButtonState();
}

class _TrainListButtonState extends State<TrainListButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Container(
          alignment: Alignment.centerRight,
          child: const Icon(
            Icons.more_vert,
            color: Color.fromRGBO(123, 123, 123, 1),
          ),
        ),
        items: [
          ...TrainMenuItems.firstItems.map(
            (item) => DropdownMenuItem<TrainMenuItem>(
              value: item,
              child: TrainMenuItems.buildItem(item),
            ),
          ),
        ],
        onChanged: (value) {
          TrainMenuItems.onChanged(context, value as TrainMenuItem);
        },
        dropdownStyleData: DropdownStyleData(
          width: 237,
          // padding: const EdgeInsets.only(left: 184),
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
          elevation: 8,
          offset: const Offset(0, -10),
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: [
            ...List<double>.filled(TrainMenuItems.firstItems.length, 48),
          ],
          padding: const EdgeInsets.only(left: 16, right: 16),
        ),
      ),
    );
  }
}
