
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/icons.dart';
import '../../../../utils/styles.dart';

class MyChatTextField extends StatelessWidget {
  const MyChatTextField({
    Key? key,
    required this.controller,
    required this.onTab
  }) : super(key: key);

  final TextEditingController controller;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: SvgPicture.asset(MyIcons.attachment, fit: BoxFit.scaleDown,),
        suffix:  GestureDetector(onTap: onTab, child: SvgPicture.asset(MyIcons.send, color: Colors.white,)),
        hintText: "Type here...",
        hintStyle: MyTextStyle.regular14.copyWith(color: MyColors.basicWhite, fontSize: 17),
        fillColor: MyColors.gray6,
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
      ),
    );
  }
}