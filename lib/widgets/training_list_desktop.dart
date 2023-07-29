import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gptsample/widgets/common_widgets.dart';

class TrainingListDesktop extends StatelessWidget {
  const TrainingListDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            verticalSpace(16),
            Container(
              width: 251,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(50)),
              child: TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search), border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(
                  top: 8.0, bottom: 8.0), // Set the desired top padding
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Bot',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Title',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'File Type',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Status',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Updated On',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Re-sync',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Visibility',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Remove',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            for (int i = 0; i < 4; i++) ...[
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8), // Set the desired top padding
                child: Row(
                  children: [
                    horizontalSpace(20),
                    const Expanded(
                        flex: 1,
                        child: Text(
                          'Bot 1',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400),
                        )),
                    const Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'https://example.com',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 24,
                          height: 31.12,
                          child: SvgPicture.asset(
                            'assets/images/Icons/Group-11.svg',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 68,
                          height: 32,
                          margin: const EdgeInsets.only(right: 20),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(175, 213, 190, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          child: const Text(
                            'Trained',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(flex: 1, child: Text('2023-6-6 16:19')),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 18.598,
                          height: 24,
                          child: SvgPicture.asset(
                            'assets/images/Icons/Group-10.svg',
                            color: const Color.fromRGBO(48, 127, 201, 1),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: 46,
                            height: 28,
                            child: SvgPicture.asset(
                              'assets/images/Icons/Group178.svg',
                              // color: Color.fromRGBO(129, 129, 129, 1),
                            ),
                          ),
                        )),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 19.2,
                          height: 24,
                          child: SvgPicture.asset(
                            'assets/images/Icons/Group-9.svg',
                            color: const Color.fromRGBO(207, 80, 80, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 0.1), width: 1),
                  ),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
