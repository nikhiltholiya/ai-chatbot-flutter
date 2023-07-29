import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gptsample/screen/botlist/bot_home_page.dart';
import 'package:gptsample/widgets/bot_list_item.dart';
import 'package:gptsample/widgets/common_widgets.dart';
import 'package:gptsample/controller/simple_ui_controller.dart';
import 'package:get/get.dart';

class BotListScreen extends StatefulWidget {
  const BotListScreen({super.key});

  @override
  State<BotListScreen> createState() => BotListScreenState();
}

class BotListScreenState extends State<BotListScreen> {
  var _selectedBot = 'Bot 1';

  SimpleUIController simpleUIController = Get.put(SimpleUIController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SimpleUIController simpleUIController = Get.find<SimpleUIController>();
    return Scaffold(
        body: Row(
      children: [
        size.width > 1200
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(216, 245, 245, 246),
                    // gradient: LinearGradient(
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    //   colors: [Color(0xFFD8DEE5), Color(0xFFF5F5F6)],
                    // ),
                  ),
                  width: 199,
                  height: size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          verticalSpace(30),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(150, 48),
                                backgroundColor:
                                    const Color.fromRGBO(96, 97, 207, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.add,
                                    size: 25,
                                  ),
                                  horizontalSpace(16),
                                  const Text(
                                    'New Bot',
                                    style: TextStyle(
                                      fontFamily: 'Robot',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
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
                                              margin: const EdgeInsets.only(
                                                  left: 16),
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
                                            margin: const EdgeInsets.only(
                                                left: 16, right: 16),
                                            child: const TextField(
                                              autofocus: true,
                                              style: TextStyle(fontSize: 16),
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 13,
                                                        horizontal: 15),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1.0,
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 32),
                                          Align(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                OutlinedButton(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              31),
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
                                                      color: Color.fromRGBO(
                                                          96, 97, 207, 1),
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color.fromRGBO(
                                                            96, 97, 207, 1),
                                                    elevation: 0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                    minimumSize:
                                                        const Size(102, 40),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    'Confirm',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Lato',
                                                      fontWeight:
                                                          FontWeight.w500,
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
                              },
                            ),
                          ),
                          verticalSpace(24),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _selectedBot = 'Root';
                                  });
                                },
                                child: BotListItem(
                                    colors: Color.fromRGBO(128, 128, 217, 1),
                                    text: 'Root',
                                    icon: 'assets/images/Icons/Group234.svg')),
                          ),
                          verticalSpace(24),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedBot = 'Bot 1';
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: _selectedBot == 'Bot 1'
                                        ? const Color(0xFFE2E5E8)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: BotListItem(
                                    colors: Color.fromRGBO(128, 128, 217, 1),
                                    text: 'Bot 1',
                                    icon: 'assets/images/Icons/Vector.svg'),
                              ),
                            ),
                          ),
                          verticalSpace(24),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedBot = 'Bot 2';
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: _selectedBot == 'Bot 2'
                                        ? const Color(0xFFE2E5E8)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: BotListItem(
                                    colors: Color.fromRGBO(89, 203, 238, 0.906),
                                    text: 'Bot 2',
                                    icon: 'assets/images/Icons/Vector.svg'),
                              ),
                            ),
                          ),
                          verticalSpace(24),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedBot = 'Bot 3';
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: _selectedBot == 'Bot 3'
                                        ? const Color(0xFFE2E5E8)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: BotListItem(
                                    colors:
                                        Color.fromRGBO(228, 177, 130, 0.962),
                                    text: 'Bot 3',
                                    icon: 'assets/images/Icons/Vector.svg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/logo1.png',
                              height: 48,
                            ),
                            verticalSpace(29),
                          ]),
                    ],
                  ),
                ),
              )
            : Container(),
        Expanded(
            child: BotHomePage(
          botName: _selectedBot,
        ))
      ],
    ));
  }
}

class TrainingData {
  TrainingData(
      {required this.type,
      required this.name,
      required this.sDateTime,
      required this.state});

  final int type;
  final String name;
  final DateTime sDateTime;
  final int state;
}

class TrainListButton extends StatefulWidget {
  const TrainListButton({Key? key}) : super(key: key);

  @override
  State<TrainListButton> createState() => _TrainListButtonState();
}

class _TrainListButtonState extends State<TrainListButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 23.94),
      child: Container(
        child: DropdownButtonHideUnderline(
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
        ),
      ),
    );
  }
}

class TrainMenuItem {
  final String text;

  const TrainMenuItem({
    required this.text,
  });
}

class TrainMenuItems {
  static const List<TrainMenuItem> firstItems = [duplicate, rename, delete];

  static const duplicate = TrainMenuItem(text: 'Sync Website');
  static const rename = TrainMenuItem(text: 'Visibility');
  static const delete = TrainMenuItem(text: 'Remove');

  // TrainMenuItem(text: 'Remove', icon: icon)

  static Widget buildItem(TrainMenuItem item) {
    return Row(
      children: [
        const SizedBox(width: 24),
        Container(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(right: 39),
            child: SizedBox(
              width: 20,
              height: 20,
              child: item.text == 'Sync Website'
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
