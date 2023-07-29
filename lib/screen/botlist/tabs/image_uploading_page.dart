import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gptsample/utils/responsive_checker.dart';

class ImageUploadingPage extends StatefulWidget {
  const ImageUploadingPage({super.key});

  @override
  State<ImageUploadingPage> createState() => ImageUploadingState();
}

class ImageUploadingState extends State<ImageUploadingPage> {
  // @override
  final List<String> filenames = [
    'Uploaded file name.pdf',
    'Uploaded file name example example.... .mp4',
  ];

  @override
  void initState() {
    super.initState();
  }

  void removeFile(int index) {
    setState(() {
      filenames.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          SizedBox(
            width: 150,
            child: DottedBorder(
              color: const Color.fromRGBO(160, 160, 226, 1),
              //color of dotted/dash line
              strokeWidth: 3,
              //thickness of dash/dots
              dashPattern: const [20, 10],
              radius: const Radius.circular(10),
              borderType: BorderType.RRect,
              child: Container(
                width: double.infinity,
                height: 180,
                // width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Color(0xffefeffa),
                ),
                child: Stack(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Positioned(
                        top: 50,
                        left: 35,
                        child: Icon(
                          Icons.add,
                          color: Color(0xFF999DA1),
                          size: 80,
                        ),
                      ),
                      ResponsiveChecker.isDesktop(context)
                          ? const Positioned(
                              top: 130,
                              left: 6,
                              child: Text(
                                'Click to add an image',
                                style: TextStyle(
                                  color: Color(0xFF999DA1),
                                ),
                              ),
                            )
                          : Container(),
                    ]),
              ),
            ),
          ),
          const SizedBox(height: 20),
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
}
