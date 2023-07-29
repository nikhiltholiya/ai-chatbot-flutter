import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:gptsample/utils/responsive_checker.dart';
import 'package:gptsample/widgets/common_widgets.dart';

class FileUploadingPage extends StatefulWidget {
  const FileUploadingPage({super.key});

  @override
  State<FileUploadingPage> createState() => FileUploadingState();
}

class FileUploadingState extends State<FileUploadingPage> {
  // @override
  final List<String> filenames = [
    'Uploaded file name.pdf',
    'Uploaded file name example example.... .mp4',
  ];

  @override
  void initState() {
    super.initState();
  }

  void RemoveFile(int index) {
    setState(() {
      filenames.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: SizedBox(
        width:
            ResponsiveChecker.isMobile(context) ? size.width : size.width / 2,
        child: Container(
          height: 320,
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 24),
              Container(
                child: DottedBorder(
                  color: const Color.fromRGBO(160, 160, 226, 1),
                  //color of dotted/dash line
                  strokeWidth: 3,
                  //thickness of dash/dots
                  dashPattern: [20, 10],
                  radius: const Radius.circular(10),
                  borderType: BorderType.RRect,
                  child: Container(
                    width: double.infinity,
                    height: 144,
                    // width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Color(0xfffff1d3),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color(0xffefeffa),
                      ),
                      child: Container(
                        // alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 24),
                            SizedBox(
                              width: 40,
                              height: 49,
                              child: SvgPicture.asset(
                                'assets/images/Icons/Vector-6.svg',
                                color: const Color(0xff999ca1),
                              ),
                            ),
                            const SizedBox(height: 21),
                            Container(
                              child: const Text(
                                'Click to upload a file',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              child: const Text(
                                'Accepted file types: pdf, doc, mp3, mp4, html',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color.fromRGBO(124, 124, 124, 1),
                                ),
                              ),
                            ),
                            const SizedBox(height: 14),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                // child: ConstrainedBox(
                child: Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    // child: SizedBox(
                    //   width: 200,
                    child: FileList(),
                    // ),
                  ),
                ),
                // ),
              ),
              verticalSpace(20),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 241.5,
                  child: _ElevatedButton('Confirm and Train'),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ElevatedButton(text) {
    return SizedBox(
      height: 48,
      // width: double.infinity,
      // color: Colors.transparent,
      // color: Colors.black,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(96, 97, 207, 1),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w500,
            letterSpacing: 0.617143,
          ),
        ),
      ),
    );
  }

  ListView FileList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: filenames.length,
      itemBuilder: (context, index) {
        String filename = filenames[index];
        return Container(
          padding: EdgeInsets.only(right: 10),
          // margin: const EdgeInsets.symmetric(vertical: 5),
          // padding: EdgeInsets.zero,
          // width: size.width,
          child: FileNameWidget(
              text: filename, index: index, onRemove: RemoveFile),
        );
      },
    );
  }
}

class FileNameWidget extends StatelessWidget {
  const FileNameWidget(
      {super.key,
      required this.text,
      required this.index,
      required this.onRemove});

  final String text;
  final int index;
  final void Function(int) onRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FittedBox(
          child: Container(
            padding: const EdgeInsets.only(top: 2, bottom: 2),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
              color: Color(0xfffff1d3),
            ),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 13),
                Text(
                  text,
                  style: const TextStyle(
                    // color: Color.fromRGBO(97, 97, 97, 1),
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1,
                    fontSize: 12,
                  ),
                ),
                // Expanded(
                Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      onRemove(index);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
