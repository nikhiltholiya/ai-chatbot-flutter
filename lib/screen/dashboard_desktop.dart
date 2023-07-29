import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gptsample/screen/botlist/botlist.dart';
import 'package:gptsample/widgets/common_widgets.dart';

class DashboardDesktop extends StatefulWidget {
  const DashboardDesktop({super.key});

  @override
  State<DashboardDesktop> createState() => _DashboardDesktopState();
}

class _DashboardDesktopState extends State<DashboardDesktop> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.grey.shade300,
          padding: const EdgeInsets.symmetric(vertical: 18),
          width: 80,
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 44.8,
                height: 44.8,
              ),
              verticalSpace(36),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(169, 135, 135, 135),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: SizedBox(
                    width: 24,
                    height: 20,
                    child: SvgPicture.asset(
                      'assets/images/Icons/Vector-3.svg',
                    ),
                  ),
                ),
              ),
              verticalSpace(48),
              SizedBox(
                width: 24,
                height: 20,
                child: SvgPicture.asset(
                  'assets/images/Icons/Vector(1).svg',
                ),
              ),
              verticalSpace(48),
              SizedBox(
                width: 24,
                height: 20,
                child: SvgPicture.asset(
                  'assets/images/Icons/Vector-2.svg',
                ),
              ),
              verticalSpace(48),
              SizedBox(
                width: 24,
                height: 20,
                child: SvgPicture.asset(
                  'assets/images/Icons/Vector-1.svg',
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'images/Icons/Question.svg',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'images/Icons/Logout.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const Expanded(child: BotListScreen()),
      ],
    );
  }
}
