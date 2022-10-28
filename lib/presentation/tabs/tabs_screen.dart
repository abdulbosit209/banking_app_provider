import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'chat/chat.dart';
import 'costs_and_benefits/costs_and_benefits.dart';
import 'home/home_page.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int currentIndex = 0;

  List<Widget> screens = const [
    MyHomePage(),
    CostsAndBenefits(),
    ChatBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: ClipRRect(
            borderRadius:  (currentIndex == 2) ? const BorderRadius.vertical(top: Radius.circular(0)) : const BorderRadius.vertical(top: Radius.circular(24)),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              backgroundColor: MyColors.gray6,
              currentIndex: currentIndex,
              items: [
                getItem(icon: SvgPicture.asset(MyIcons.finance)),
                getItem(icon: SvgPicture.asset(MyIcons.ordinal)),
                getItem(icon: SvgPicture.asset(MyIcons.chat)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem getItem({
    required Widget icon,
  }) {
    return BottomNavigationBarItem(
      label: "",
      icon: Container(margin: const EdgeInsets.only(top: 10), child: icon),
      activeIcon: Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width * 0.35,
        height: 44,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: (currentIndex == 0)
                  ? MyColors.yellowGreen
                  : (currentIndex == 1)
                  ? MyColors.yellowPink
                  : MyColors.tealIndigo,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: icon,
      ),
    );
  }
}