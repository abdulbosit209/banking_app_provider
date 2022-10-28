import 'package:banking_app/presentation/transactions/widgets/myCarts.dart';
import 'package:banking_app/view_model/transaction_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../../utils/styles.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Consumer<TransactionViewModel>(
        builder: (context, transactionData, child){
          return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        MyCard(
                          cityName: 'Tokyo travel',
                          colorsGradient: MyColors.yellowGreen,
                        ),
                        MyCard(
                          cityName: 'Moscow travel',
                          colorsGradient: MyColors.yellowPink,
                        ),
                        MyCard(
                          cityName: 'London travel',
                          colorsGradient: MyColors.tealIndigo,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.78,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: MyColors.gray3,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        )),
                    child: Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 20),
                              child: SvgPicture.asset(
                                MyIcons.down,
                                height: 30,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 20, left: 20),
                                child: Text(
                                  DateFormat.yMMMd().format(DateTime.now()),
                                  style: MyTextStyle.bold32
                                      .copyWith(fontSize: 30, color: Colors.white),
                                )),
                            const SizedBox(width: 30,),
                            Padding(
                                padding: const EdgeInsets.only(top: 20, left: 20),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: MyColors.gray1),
                                  child: SvgPicture.asset(MyIcons.search,
                                      fit: BoxFit.scaleDown),
                                )),
                            Padding(
                                padding: const EdgeInsets.only(top: 20, left: 20),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: MyColors.gray1),
                                  child: SvgPicture.asset(MyIcons.calendar,
                                      fit: BoxFit.scaleDown),
                                )),
                          ],
                        ),
                        Expanded(
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: List.generate(transactionData.universalItems.length, (index) => ListTile(
                              leading: CircleAvatar(
                                radius: 30, // Image radius
                                backgroundImage: NetworkImage(transactionData.universalItems[index].imageUrl),
                              ),
                              title: Text(transactionData.universalItems[index].name, style: MyTextStyle.semiBold14.copyWith(color: Colors.white, fontSize: 20),),
                              subtitle: Text(transactionData.universalItems[index].typeName, style: MyTextStyle.light32.copyWith(color: Colors.white, fontSize: 15),),
                              trailing: Column(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: (transactionData.universalItems[index].isExpense) ? "- " : "",
                                      style: TextStyle(color: (transactionData.universalItems[index].isExpense) ? Colors.red : Colors.green),
                                      children:  <TextSpan>[
                                        TextSpan(text: "${transactionData.universalItems[index].amount} ¥", style: TextStyle(fontSize: 17,color: (transactionData.universalItems[index].isExpense) ? Colors.red : Colors.green)),
                                      ],
                                    ),
                                  ),
                                  Text(DateFormat.jm().format(transactionData.universalItems[index].dateTime), style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ))

                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      )
    );
  }
}
