import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gptsample/widgets/common_widgets.dart';
import 'package:gptsample/widgets/train_list_button.dart';
import 'package:gptsample/screen/botlist/pages/uploaded_content.dart';

class TrainingListMobile extends StatelessWidget {
  const TrainingListMobile({super.key});

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
      child: Column(
        children: [
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'images/Icons/Search.svg',
                width: 20,
                height: 20,
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UploadedContent())),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('See all'),
                    horizontalSpace(8),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade600,
                      size: 18,
                    )
                  ],
                ),
              )
            ],
          ),
          // ),
          const SizedBox(height: 16),
          Expanded(
              child: ListView.separated(
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 31.12,
                          child: SvgPicture.asset(
                            'assets/images/Icons/Group-11.svg',
                          ),
                        ),
                        horizontalSpace(8),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'https://example.com',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '2023-6-6 16:19',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto',
                                color: Color.fromRGBO(123, 123, 123, 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 67.83,
                      height: 24,
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
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    const TrainListButton()
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 0.1), width: 1),
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
