import 'package:flutter/material.dart';
import 'package:gptsample/widgets/common_widgets.dart';

class TextUploadingPage extends StatefulWidget {
  const TextUploadingPage({super.key});
  @override
  State<TextUploadingPage> createState() => TextUploadingPageState();
}

class TextUploadingPageState extends State<TextUploadingPage> {
  final List<String> urls = [''];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: SingleChildScrollView(
        child: Container(
          // color: Colors.white,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 24),
              const Text(
                'Title',
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      // width: 310,
                      width: 360,
                      height: 40,
                      child: TextField(
                        autofocus: true,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 13, horizontal: 15),
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(108, 108, 108, 1),
                            fontSize: 16,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const Text(
                'Input Data',
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      // width: 310,
                      width: 360,
                      height: 140,
                      child: TextField(
                        maxLines: 8,
                        autofocus: true,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 13, horizontal: 15),
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(108, 108, 108, 1),
                            fontSize: 16,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              verticalSpace(24),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 241.5,
                  child: _ElevatedButton('Confirm and Train'),
                ),
              ),
              verticalSpace(24),
              // Container(child: TrainingList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ElevatedButton(text) {
    return SizedBox(
      height: 48,
      width: double.infinity,
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
