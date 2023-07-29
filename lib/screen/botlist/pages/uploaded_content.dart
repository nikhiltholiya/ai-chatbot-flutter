import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gptsample/widgets/common_widgets.dart';
import 'package:gptsample/widgets/train_list_button.dart';

class UploadedContent extends StatefulWidget {
  const UploadedContent({super.key});

  @override
  State<UploadedContent> createState() => _UploadedContentState();
}

class _UploadedContentState extends State<UploadedContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          'Uploaded Content',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 42,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(50)),
              child: TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search), border: InputBorder.none),
              ),
            ),
            verticalSpace(16),
            Expanded(
                child: ListView.separated(
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey.shade400,
                  ),
                  horizontalSpace(8),
                  const Text("1"),
                  horizontalSpace(8),
                  const Text('2'),
                  horizontalSpace(8),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.shade400,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
