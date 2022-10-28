import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/icons.dart';
import 'package:banking_app/utils/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../data_layer/models/user_cart.dart';
import '../../../utils/constants.dart';
import '../../../utils/hex_color.dart';
import '../../../view_model/card_view_model.dart';
import '../../../widgets/cart_text.dart';
import '../../../widgets/reactange_row.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<UserCart> userCards = context.watch<CardsViewModel>().getUserCards;
    print("USER CARDS LENGTH:${userCards.length}");
    double amount = 0.0;
    for(int i = 0; i < userCards.length; i++){
      amount += userCards[i].moneyAmount;
    }
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 48,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).cardColor,
                      ),
                      child: Center(child: SvgPicture.asset(MyIcons.settings)),
                    ),
                    SizedBox(
                        width: 48,
                        height: 48,
                        child: Image.asset(MyIcons.girlProfile)),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, transactionsRoute);
                      },
                      child: Container(
                        width: 48,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).cardColor,
                        ),
                        child: Center(child: SvgPicture.asset(MyIcons.notif)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 220,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total balance",
                            style: MyTextStyle.regular16
                                .copyWith(color: MyColors.gray1),
                          ),
                          const SizedBox(height: 8),
                           CardText(
                            t1: "£ $amount",
                            t2: "",
                            fontSize: 32,
                          ),
                          // Text("$amount", style: MyTextStyle.cardNumber.copyWith(color: Colors.white, fontSize: 30),),
                          const SizedBox(height: 30),
                          Text(
                            "This month",
                            style: MyTextStyle.regular16
                                .copyWith(color: MyColors.gray1),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              SvgPicture.asset(MyIcons.income),
                              const SizedBox(width: 15),
                              const CardText(
                                t1: "£ 5,235",
                                t2: ".25",
                                fontSize: 20,
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              SvgPicture.asset(MyIcons.expense),
                              const SizedBox(width: 15),
                              const CardText(
                                t1: "£ 3,710",
                                t2: ".80",
                                fontSize: 20,
                              )
                            ],
                          ),
                        ],
                      ),
                      ...List.generate(userCards.length, (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 200,
                        width: 340,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              HexColor.fromHex(userCards[index].colors.colorA),
                              HexColor.fromHex(userCards[index].colors.colorB)
                            ]
                          )
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                                right: 0,
                                child: Image.network(userCards[index].iconImage, height: 100, width: 100,)),
                            Positioned(
                                top: 20,
                                left: 20,
                                child: Text(userCards[index].bankName, style: MyTextStyle.semiBold20.copyWith(fontSize: 30, color: Colors.white),)),
                            Positioned(
                                top: 50,
                                left: 20,
                                child: Text(userCards[index].cardNumber, style: MyTextStyle.cardNumber.copyWith(fontSize: 20, color: Colors.white),)),
                            Positioned(
                                top: 80,
                                left: 20,
                                child: Text(DateFormat.yM().format(DateTime.parse(userCards[index].expireDate)), style: MyTextStyle.light32.copyWith(fontSize: 20, color: Colors.white),)),
                            Positioned(
                                bottom: 25,
                                left: 20,
                                child: Image.asset("assets/images/sum_icon.png", height: 25,)),
                            Positioned(
                                bottom: 20,
                                left: 50,
                                child: Text("${userCards[index].moneyAmount}", style: MyTextStyle.bold32.copyWith(fontSize: 30, color: Colors.white),))
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                const SizedBox(height: 33),
                const RectangleRow(
                    t1: "Transfer",
                    t2: "Exchange",
                    t3: "Payments",
                    ch1: MyIcons.arrows,
                    ch2: MyIcons.currency,
                    ch3: MyIcons.wallet),
                const SizedBox(height: 24),
                const RectangleRow(
                    t1: "Credits",
                    t2: "Deposits",
                    t3: "Cashback",
                    ch1: MyIcons.purchase,
                    ch2: MyIcons.percent,
                    ch3: MyIcons.gift),
                const SizedBox(height: 24),
                const RectangleRow(
                    t1: "ATM",
                    t2: "Security",
                    t3: "More",
                    ch1: MyIcons.money,
                    ch2: MyIcons.security,
                    ch3: MyIcons.grid),
              ],
            ),
          ),
        ),
      ),
    );
  }
}