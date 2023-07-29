import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gptsample/screen/botlist/bot_home_page.dart';
import 'package:gptsample/widgets/bot_list_item.dart';
import 'package:gptsample/widgets/common_widgets.dart';
import 'package:gptsample/screen/dashboard_screen.dart';
import 'package:gptsample/screen/chat_screen.dart';
import 'package:gptsample/screen/theme_screen.dart';
import 'package:gptsample/screen/analytics_screen.dart';
import 'package:gptsample/screen/profile_screen.dart';

class DashboardMobile extends StatefulWidget {
  const DashboardMobile({super.key});

  @override
  State<DashboardMobile> createState() => _DashboardMobileState();
}

class _DashboardMobileState extends State<DashboardMobile> {
  var _selectedBot = "";
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
    // Add your specific actions here
    switch (index) {
      case 0:
        // Code for when item 0 is pressed
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DashboardScreen()));
        break;
      case 1:
        // Code for when item 1 is pressed
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChatScreen()));
        break;
      case 2:
        // Code for when item 2 is pressed
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ThemeScreen()));
        break;
      case 3:
        // Code for when item 2 is pressed
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AnalyticsScreen()));
        break;
      case 4:
        // Code for when item 2 is pressed
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: size.width < 1300
          ? AppBar(
              toolbarHeight: 70,
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                    color: Colors.black,
                  );
                },
              ),
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: Text(
                'Bot 1',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              actions: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  width: 40,
                  height: 40,
                )
              ],
            )
          : AppBar(
              toolbarHeight: 0,
            ),
      body: const BotHomePage(botName: 'Root'),
      drawer: ClipRRect(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(10)),
        child: Drawer(
          width: 302,
          backgroundColor: const Color.fromRGBO(245, 247, 249, 1),
          child: SizedBox(
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 26, right: 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(48),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150, 48),
                            backgroundColor:
                                const Color.fromRGBO(96, 97, 207, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.add),
                              horizontalSpace(16),
                              const Text(
                                'New Bot',
                                style: TextStyle(
                                  fontFamily: 'Robot',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (_) => AlertDialog(
                                backgroundColor: Colors.white,
                                contentPadding: EdgeInsets.zero,
                                content: SizedBox(
                                  width: 363,
                                  height: 240,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          margin: EdgeInsets.zero,
                                          child: IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(
                                              Icons.close_rounded,
                                              color: Color(0xffb7babd),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(left: 16),
                                          child: const Text(
                                            'Bot name',
                                            style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: const TextField(
                                          autofocus: true,
                                          style: TextStyle(fontSize: 16),
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 13,
                                                    horizontal: 15),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1.0,
                                                  color: Colors.grey),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1.0),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 32),
                                      Align(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(31),
                                                ),
                                                side: BorderSide.none,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 16,
                                                  color: Color.fromRGBO(
                                                      96, 97, 207, 1),
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromRGBO(
                                                        96, 97, 207, 1),
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                                minimumSize:
                                                    const Size(102, 40),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'Confirm',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.617143,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                    ],
                                  ),
                                ),
                              ),
                              barrierColor: Colors.white.withOpacity(0.7),
                            );
                          },
                        ),
                      ),
                      verticalSpace(34),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedBot = 'Root';
                          });
                        },
                        child: Container(
                            color: _selectedBot == 'Root'
                                ? Color(0xFFE2E5E8)
                                : Colors.transparent,
                            child: BotListItem(
                                text: 'Root',
                                icon: 'assets/images/Icons/Group234.svg')),
                      ),
                      verticalSpace(24),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _selectedBot = 'Bot 1';
                            });
                          },
                          child: BotListItem(
                              text: 'Bot 1',
                              icon: 'assets/images/Icons/Vector.svg')),
                      verticalSpace(24),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _selectedBot = 'Bot 2';
                            });
                          },
                          child: BotListItem(
                              text: 'Bot 2',
                              icon: 'assets/images/Icons/Vector.svg')),
                      verticalSpace(24),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _selectedBot = 'Bot 3';
                            });
                          },
                          child: BotListItem(
                              text: 'Bot 3',
                              icon: 'assets/images/Icons/Vector.svg')),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Image.asset(
                    'assets/images/logo1.png',
                    height: 48,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
          height: 88,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromRGBO(245, 247, 249, 1),
            selectedLabelStyle: TextStyle(fontSize: 12, height: 1.8),
            unselectedLabelStyle: TextStyle(fontSize: 12, height: 1.8),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/Icons/Vector-3.svg',
                  width: 22,
                  height: 18.07,
                  color: const Color.fromRGBO(96, 97, 207, 1),
                ),
                label: 'Bot',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/Icons/Vector(1).svg',
                  width: 20,
                  height: 17.232,
                ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/Icons/Vector-2.svg',
                  width: 13.402,
                  height: 20,
                ),
                label: 'Theme',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/Icons/Vector-1.svg',
                  width: 20,
                  height: 17.746,
                ),
                label: 'Analytics',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/Icons/Group1.svg',
                  width: 18,
                  height: 20,
                ),
                label: 'Profile',
              ),
            ],
            selectedItemColor: const Color.fromRGBO(96, 97, 207, 1),
            unselectedItemColor: const Color.fromRGBO(97, 97, 97, 1),
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          )),
    );
  }
}
