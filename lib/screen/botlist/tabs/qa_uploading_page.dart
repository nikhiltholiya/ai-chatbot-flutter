import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:gptsample/widgets/common_widgets.dart';

class QAUploadingPage extends StatefulWidget {
  const QAUploadingPage({super.key});

  @override
  State<QAUploadingPage> createState() => FileUploadingState();
}

class FileUploadingState extends State<QAUploadingPage> {
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
    return Container(
      height: 370,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 24),
          SizedBox(
            width: 350,
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
                height: 144,
                // width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: const Color(0xffefeffa),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      color: Color(0xFF6061CF),
                    ),
                    horizontalSpace(10),
                    const Text(
                      'Add a Q&A',
                      style: TextStyle(
                        color: Color(0xFF6061CF),
                      ),
                    ),
                  ],
                ),
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
