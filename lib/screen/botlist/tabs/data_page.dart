import 'package:flutter/material.dart';
import 'package:gptsample/screen/botlist/tabs/file_uploading_page.dart';
import 'package:gptsample/screen/botlist/tabs/url_upload_page.dart';
import 'package:gptsample/utils/responsive_checker.dart';
import 'package:gptsample/widgets/custom_radio_button.dart';
import 'package:gptsample/widgets/training_list_mobile.dart';
import 'package:gptsample/screen/botlist/tabs/image_uploading_page.dart';
import 'package:gptsample/screen/botlist/tabs/qa_uploading_page.dart';
import 'package:gptsample/screen/botlist/tabs/text_upload_page.dart';
import 'package:gptsample/widgets/common_widgets.dart';
import 'package:gptsample/widgets/training_list_desktop.dart';
import 'package:gptsample/widgets/training_list_tablet.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});
  @override
  State<DataPage> createState() => DataPageState();
}

class DataPageState extends State<DataPage> {
  late int index = 1;
  void selChange(int ind) {
    setState(() {
      index = ind;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 16),
      child: Column(
        children: [
          SizedBox(
              height: 16,
              width: double.infinity,
              child: Container(
                color: Colors.white,
              )),
          Container(
            color: Colors.white,
            child: CustomRadioButtonGroup(
              selChange: selChange,
            ),
          ),
          Container(
            child: index == 1
                ? const UrlUploadingPage()
                : index == 2
                    ? const FileUploadingPage()
                    : index == 3
                        ? const ImageUploadingPage()
                        : index == 4
                            ? const QAUploadingPage()
                            : const TextUploadingPage(),
          ),
          SizedBox(
              height: 50,
              width: double.infinity,
              child: Container(
                color: Colors.white,
              )),
          Container(
            height: 1,
            color: Colors.grey,
          ),
          Expanded(
              child: ResponsiveChecker.isMobile(context)
                  ? const TrainingListMobile()
                  : ResponsiveChecker.isDesktop(context)
                      ? const TrainingListDesktop()
                      : const TrainingListTablet()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF7B7B7B),
                ),
                horizontalSpace(6),
                Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xFF7C88EB),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    '1',
                  ),
                ),
                horizontalSpace(8),
                Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    // color: Color(0xFF7C88EB),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    '2',
                  ),
                ),
                horizontalSpace(6),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF7B7B7B),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
