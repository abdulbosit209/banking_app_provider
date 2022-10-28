


import 'package:banking_app/data_layer/db/cached_username_message.dart';
import 'package:banking_app/presentation/tabs/chat/widgets/text_fileld.dart';
import 'package:banking_app/utils/styles.dart';
import 'package:banking_app/view_model/chat_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../../utils/icons.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({Key? key}) : super(key: key);

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(top: 10, left: 10),
          child: CircleAvatar(
            radius: 30, // Image radius
            backgroundImage: AssetImage(MyIcons.personImage),
          ),
        ),
        title: Text("Support", style: MyTextStyle.semiBold14.copyWith(fontSize: 20, color: Colors.white),),
        actions: [
          Padding(
              padding: const EdgeInsets.only(top: 20, right: 10),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.gray2),
                child: SvgPicture.asset(MyIcons.menu,
                    fit: BoxFit.scaleDown),
              ))
        ],
      ),
      body: Consumer<ChatViewModel>(
        builder: (context, chatData, child){
          return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: ListView(
                    children: List.generate(chatData.texts.length, (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(chatData.texts[index].sentMessage, style: const TextStyle(color: Colors.white, fontSize: 17),),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
                // const Expanded(child: SizedBox()),
                MyChatTextField(controller: controller, onTab: () async {
                  if(controller.text.isNotEmpty){
                    await chatData.insertMessage(cachedUserMessageModel: CachedUserMessageModel(
                        sentMessage: controller.text,
                        time: DateFormat.yMMMd().format(DateTime.now())));
                    controller.clear();
                   await context.read<ChatViewModel>().fetchMessages();
                  }
                },)
              ],
            ),
          );
        },
      ),
    );
  }
}


