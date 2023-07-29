import 'package:flutter/material.dart';
import 'package:gptsample/utils/responsive_checker.dart';
import 'package:gptsample/widgets/common_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class tempAibot extends StatelessWidget {
  const tempAibot({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: AiBot(),
    );
  }
}

class AiBot extends StatefulWidget {
  const AiBot({super.key});
  @override
  State<AiBot> createState() => AiBotState();
}

class AiBotState extends State<AiBot> {
  final List<String> _history = [
    'Hello, nice to meet you, I am your chatbot. I provide instant responses.',
    'Can you introduce this company to me?',
    '...',
  ];
  final _scrollController = ScrollController();
  final _userQuery = TextEditingController();
  late int _showRecord = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          // BoxShadow(blurRadius: 18.0, spreadRadius: -4),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 221,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color.fromRGBO(96, 97, 207, 1),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 47),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 16),
                      SizedBox(
                        // color: Colors.red,
                        width: 58,
                        height: 56,
                        // child: SvgPicture.asset('assets/images/logo3.svg'),
                        child: Image.asset('images/logo2.png',
                            width: 56, height: 56),
                      ),
                      horizontalSpace(16),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              'Bot',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lato',
                                fontStyle: FontStyle.normal,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(height: 9),
                          Text(
                            'AI Chatbot | Digital Experience Expert',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Lato',
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 119,
            left: 0,
            right: 0,
            bottom: 93,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 66),
                  Expanded(child: showHistory()),
                ],
              ),
            ),
          ),
          Positioned(
            top: 135,
            right: 17,
            child: ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    _history.clear();
                    _history.add(
                      'Hello, nice to meet you, I am your chatbot. I provide instant responses.',
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: const Color.fromRGBO(245, 247, 249, 1),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.refresh,
                    color: Color.fromRGBO(115, 119, 123, 1),
                  ),
                  Text(
                    'Start Again',
                    style: TextStyle(
                      color: Color.fromRGBO(97, 97, 97, 1),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 92,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: IconButton(
                          onPressed: () async {
                            // debugPrint('recording');
                            setState(() {
                              _showRecord = 1;
                            });
                          },
                          icon: SvgPicture.asset(
                              'assets/images/Icons/Group-14.svg')),
                    ),
                    const Flexible(child: SizedBox(width: 16)),
                    Flexible(
                      flex: 8,
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _userQuery,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 12.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(40.0),
                              ),
                            ),
                          ),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    const Flexible(child: SizedBox(width: 16)),
                    Flexible(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _history.add(_userQuery.text);
                            _history.add('...');
                            _userQuery.clear();
                          });
                        },
                        // icon: const Icon(
                        //   Icons.near_me,
                        //   color: Color.fromRGBO(96, 97, 207, 1),
                        //   size: 30,
                        // ),
                        icon: SvgPicture.asset(
                            'assets/images/Icons/Vector-11.svg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ResponsiveChecker.isMobile(context)
              ? Positioned(
                  top: 64,
                  right: 24,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.keyboard_arrow_down),
                      color: Colors.white,
                      iconSize: 40,
                    ),
                  ),
                )
              : Container(),
          _showRecord == 1
              ? Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Center(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: const Color.fromRGBO(230, 233, 236, 0.9),
                          ),
                        ),
                        Stack(
                          children: [
                            Positioned(
                                child: Container(
                              height: 360,
                              width: double.infinity,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      const SizedBox(width: 56),
                                      Expanded(
                                        child: SizedBox(
                                          height: 40,
                                          child: TextField(
                                            controller: _userQuery,
                                            decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 12.0,
                                                      horizontal: 12.0),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(40.0),
                                                ),
                                              ),
                                            ),
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _history.add(_userQuery.text);
                                              _history.add('...');
                                              _userQuery.clear();
                                            });
                                          },
                                          icon: SvgPicture.asset(
                                              'assets/images/Icons/Vector-11.svg'),
                                        ),
                                      ),
                                      const SizedBox(width: 24),
                                    ],
                                  ),
                                  const SizedBox(height: 95),
                                  const Text(
                                    'Press hold to speak',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        fontFamily: 'Roboto'),
                                  ),
                                  const SizedBox(height: 24),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      margin:
                                          const EdgeInsets.only(bottom: 76.6),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 72,
                                            height: 72,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffeaf5ee),
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {});
                                              },
                                              icon: SvgPicture.asset(
                                                'assets/images/Vector.svg',
                                                width: 25.95,
                                                height: 40,
                                              ),
                                              // icon: const Icon(Icons.mic),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            Positioned(
                              bottom: 76.6,
                              right: 40,
                              child: Container(
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.zero,
                                child: IconButton(
                                  onPressed: () {
                                    // Navigator.pop(context);
                                    setState(() {
                                      _showRecord = 0;
                                    });
                                  },
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  color: const Color(0xff616161),
                                  iconSize: 40,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : Positioned(child: Container()),
        ],
      ),
    );
  }

  ListView showHistory() {
    return ListView.builder(
      itemCount: _history.length,
      controller: _scrollController,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        var text = _history[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: Container(
            width: double.infinity,
            child: Row(
              children: [
                Flexible(
                  child: MessageWidget(text: text, type: index % 2),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.text, required this.type});
  final String text;
  final int type;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: type == 1 ? userResponse(text, 287.0) : botResponse(text, 282.0),
    );
  }
}

Widget botResponse(text, width) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(width: 16),
      Flexible(
        child: Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(246, 246, 246, 1),
          ),
          // child: Image.asset('assets/images/bot1.png'),
          child: SvgPicture.asset(
            'assets/images/Icons/Vector.svg',
          ),
        ),
      ),
      const SizedBox(width: 8),
      Flexible(
        flex: 5,
        child: SizedBox(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Color.fromRGBO(245, 247, 249, 1),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 15.82, 13, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontFamily: 'Robot',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Flexible(child: SizedBox(width: 16)),
                      Flexible(
                        child: SvgPicture.asset(
                          'assets/images/Icons/Group317.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      const Flexible(child: SizedBox(width: 16)),
                      Flexible(
                        child: SvgPicture.asset(
                          'assets/images/Icons/Group220.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget userResponse(text, width) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      const SizedBox(width: 8),
      Flexible(
        child: SizedBox(
          width: width,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Color.fromRGBO(96, 97, 207, 1),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 15.82, 13, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontFamily: 'Robot',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
