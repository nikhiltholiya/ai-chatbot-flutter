import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gptsample/utils/responsive_checker.dart';
import 'package:gptsample/widgets/common_widgets.dart';
import 'package:gptsample/widgets/tsp_button.dart';
import 'package:gptsample/controller/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EnteredLinks extends ConsumerStatefulWidget {
  const EnteredLinks({super.key});

  @override
  ConsumerState<EnteredLinks> createState() => _EnteredLinksState();
}

class _EnteredLinksState extends ConsumerState<EnteredLinks> {
  @override
  Widget build(BuildContext context) {
    final uploadDataprovider = ref.read(uploadDataScreenProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () => ResponsiveChecker.isDesktop(context)
                ? uploadDataprovider.changeDataChartVlaue(true)
                : Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          'Entered Links',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                          hintText: 'Enter a URL',
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
                  Icon(
                    Icons.add,
                    color: Color.fromRGBO(83, 83, 83, 1),
                    size: 30,
                  ),
                ],
              ),
              verticalSpace(8),
              Row(
                children: [
                  const Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: "https://example.com",
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
                  const SizedBox(width: 10),
                  const TspButton(text: 'Fetch'),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(
                      'assets/images/Icons/Group.svg',
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              verticalSpace(8),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      const Expanded(
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
                              hintText: 'Enter a URL',
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
                      horizontalSpace(8),
                      SizedBox(
                        width: 24,
                        height: 24,
                        child:
                            SvgPicture.asset('assets/images/Icons/Group.svg'),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return verticalSpace(8);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
