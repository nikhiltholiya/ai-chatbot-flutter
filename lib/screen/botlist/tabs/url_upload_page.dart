import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gptsample/screen/botlist/pages/external_links.dart';
import 'package:gptsample/utils/responsive_checker.dart';
import 'package:gptsample/widgets/common_widgets.dart';
import 'package:gptsample/widgets/tsp_button.dart';
import 'package:gptsample/controller/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UrlUploadingPage extends ConsumerStatefulWidget {
  const UrlUploadingPage({super.key});
  @override
  ConsumerState<UrlUploadingPage> createState() => UrlUploadingPageState();
}

class UrlUploadingPageState extends ConsumerState<UrlUploadingPage> {
  final List<String> urls = [''];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final uploadDataprovider = ref.read(uploadDataScreenProvider);
    return SingleChildScrollView(
      child: SizedBox(
        width:
            ResponsiveChecker.isMobile(context) ? size.width : size.width / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            verticalSpace(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Enter Links',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () {
                    ResponsiveChecker.isDesktop(context)
                        ? uploadDataprovider.changeDataChartVlaue(false)
                        : Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const EnteredLinks()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: 360,
                    height: 40,
                    child: TextField(
                      autofocus: true,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 15),
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
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 15),
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
            verticalSpace(24),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 209.781,
                child: _ElevatedButton('Confirm and Train'),
              ),
            ),
            verticalSpace(24),
          ],
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
          backgroundColor: const Color(0xFF6061CF),
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
