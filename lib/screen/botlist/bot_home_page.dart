import 'package:flutter/material.dart';
import 'package:gptsample/screen/botlist/tabs/data_page.dart';
import 'package:gptsample/widgets/custom_tab_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gptsample/widgets/bot_sel_button.dart';
import 'package:gptsample/screen/_chatbot/_chatbot.dart';
import 'package:gptsample/utils/responsive_checker.dart';
import 'package:gptsample/screen/botlist/pages/external_links.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gptsample/controller/providers.dart';

class BotHomePage extends ConsumerStatefulWidget {
  final String botName;
  const BotHomePage({super.key, required this.botName});

  @override
  ConsumerState<BotHomePage> createState() => _BotHomePageState();
}

class _BotHomePageState extends ConsumerState<BotHomePage>
    with SingleTickerProviderStateMixin {
  bool seeAllUrls = false;
  bool showChat = false;
  late TabController tabController;
  final ScrollController verticalScroll = ScrollController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 5,
      initialIndex: 0,
      vsync: this,
    );
  }

  void updateSeeAllUrls(bool newValue) {
    setState(() {
      seeAllUrls = !newValue;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final uploadDataprovider = ref.watch(uploadDataScreenProvider);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  ResponsiveChecker.isDesktop(context)
                      ? Padding(
                          padding: const EdgeInsets.only(top: 40.0, left: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.botName,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                              const CircleAvatar(
                                child: Icon(Icons.account_circle_rounded),
                              )
                            ],
                          ),
                        )
                      : Container(),
                  Container(
                    width: size.width,
                    child: TabBar(
                      // labelPadding:
                      //     EdgeInsets.symmetric(horizontal: size.width * 0.065),
                      indicator: const CustomTabIndicator(),
                      controller: tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable:
                          ResponsiveChecker.isMobile(context) ? true : false,
                      unselectedLabelColor: Colors.black,
                      labelColor: const Color.fromRGBO(81, 96, 229, 1),
                      tabs: [
                        Tab(
                          child: Text(
                            'Data Upload',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: ResponsiveChecker.isMobile(context)
                                    ? 12
                                    : 16),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Customization',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  ResponsiveChecker.isMobile(context) ? 12 : 16,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Conversation',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  ResponsiveChecker.isMobile(context) ? 12 : 16,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Channels',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  ResponsiveChecker.isMobile(context) ? 12 : 16,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Analytics',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  ResponsiveChecker.isMobile(context) ? 12 : 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  Container(
                    // width: 1000,
                    height: size.height * 0.88,
                    color: Colors.grey.shade200,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: SizedBox(
                            child: TabBarView(
                              children: <Widget>[
                                Container(
                                  color: Colors.white,
                                  child: uploadDataprovider.showDataChart
                                      ? const DataPage()
                                      : const EnteredLinks(),
                                ),
                                const Center(
                                  child: Text('Tab 2'),
                                ),
                                const Center(
                                  child: Text('Tab 3'),
                                ),
                                const Center(
                                  child: Text('Tab 4'),
                                ),
                                const Center(
                                  child: Text('Tab 5'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ResponsiveChecker.isDesktop(context)
                            ? AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                width: showChat ? 450 : 0,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 20, bottom: 80, right: 20),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16.0)),
                                    // color: Colors.white
                                  ),
                                  child: const tempAibot(),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  )
                ],
              ),
              ResponsiveChecker.isTablet(context)
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: Visibility(
                        visible: showChat,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28.0, vertical: 22),
                          child: SizedBox(
                            height: size.height / 1.4,
                            width: size.width >= 1300
                                ? size.width / 4
                                : size.width / 2,
                            child: const AiBot(),
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),

        // Make rounded corners of menu
        drawer: ClipRRect(
          borderRadius: const BorderRadius.only(topRight: Radius.circular(10)),
          child: Drawer(
            width: 302,
            backgroundColor: const Color.fromRGBO(245, 247, 249, 1),
            child: Container(
              padding: const EdgeInsets.only(left: 13, right: 26),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.menu,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 161,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(161, 48),
                          backgroundColor: const Color.fromRGBO(96, 97, 207, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: const Icon(Icons.add),
                            ),
                            const SizedBox(width: 19),
                            Container(
                              child: const Text(
                                'New Bot',
                                style: TextStyle(
                                  fontFamily: 'Robot',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          print('00000000000000000');
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  BotSelButton(
                      text: 'Root',
                      icon:
                          SvgPicture.asset('assets/images/Icons/Group234.svg')),
                  const SizedBox(height: 28),
                  BotSelButton(
                      text: 'Bot 1',
                      icon: SvgPicture.asset('assets/images/Icons/Vector.svg')),
                  const SizedBox(height: 28),
                  BotSelButton(
                      text: 'Bot 2',
                      icon: SvgPicture.asset(
                        'assets/images/Icons/Vector.svg',
                        color: const Color.fromRGBO(64, 195, 237, 1),
                      )),
                  const SizedBox(height: 28),
                  BotSelButton(
                      text: 'Bot 3',
                      icon: SvgPicture.asset(
                        'assets/images/Icons/Vector.svg',
                        color: const Color.fromRGBO(225, 166, 111, 1),
                      )),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 33),
                        width: 140,
                        height: 48,
                        child: Image.asset('assets/images/logo1.png'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (ResponsiveChecker.isMobile(context)) {
              print(size.width);
              print(size.height);
              setState(() {
                showChat = !showChat;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const tempAibot(),
                ),
              );
            } else if (ResponsiveChecker.isTablet(context)) {
              setState(() {
                showChat = !showChat;
              });
            } else if (ResponsiveChecker.isDesktop(context)) {
              setState(() {
                showChat = !showChat;
              });
            }
          },
          backgroundColor: const Color.fromRGBO(128, 128, 217, 1),
          child: showChat
              ? const Icon(Icons.keyboard_arrow_down_outlined)
              : const Icon(Icons.keyboard_arrow_up_outlined),
        ),
        // : Container(),
        // bottomNavigationBar: size.width < 1300
        //     ? SizedBox(
        //         height: 70,
        //         child: BottomNavigationBar(
        //           type: BottomNavigationBarType.fixed,
        //           backgroundColor: Color.fromRGBO(245, 247, 249, 1),
        //           items: [
        //             BottomNavigationBarItem(
        //               // icon: Icon(Icons.home),
        //               icon: SvgPicture.asset(
        //                 'assets/images/Icons/Vector-3.svg',
        //                 width: 28,
        //                 height: 23,
        //                 color: Color.fromRGBO(96, 97, 207, 1),
        //               ),
        //               label: 'Bot',
        //             ),
        //             BottomNavigationBarItem(
        //               icon: SvgPicture.asset(
        //                 'assets/images/Icons/Vector(1).svg',
        //                 width: 28,
        //                 height: 24,
        //               ),
        //               label: 'Chat',
        //             ),
        //             BottomNavigationBarItem(
        //               icon: SvgPicture.asset(
        //                 'assets/images/Icons/Vector-2.svg',
        //                 width: 28,
        //                 height: 24,
        //               ),
        //               label: 'Theme',
        //             ),
        //             BottomNavigationBarItem(
        //               icon: SvgPicture.asset(
        //                 'assets/images/Icons/Vector-1.svg',
        //                 width: 28,
        //                 height: 24,
        //               ),
        //               label: 'Analytics',
        //             ),
        //             BottomNavigationBarItem(
        //               icon: SvgPicture.asset(
        //                 'assets/images/Icons/Group1.svg',
        //                 width: 28,
        //                 height: 24,
        //               ),
        //               label: 'Profile',
        //             ),
        //           ],
        //           selectedItemColor: Color.fromRGBO(96, 97, 207, 1),
        //           unselectedItemColor: Color.fromRGBO(97, 97, 97, 1),
        //         ))
        //     : SizedBox(
        //         height: 0,
        //       ),
      ),
    );
  }

  Widget botButton() {
    return SizedBox(
      height: 48,
      width: 48,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(96, 97, 207, 1)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        onPressed: () {
          print('222222222');
        },
        child: const Icon(
          Icons.keyboard_arrow_up,
          size: 30,
        ),
      ),
    );
  }
}
