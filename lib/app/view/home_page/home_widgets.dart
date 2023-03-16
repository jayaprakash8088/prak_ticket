import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/my_colors.dart';
import '../../utils/my_strings.dart';
import '../../utils/my_style.dart';
import '../../view_model/home_page_view_model.dart';

class TotalCostWidget extends StatelessWidget {
  const TotalCostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageViewModel homePageViewModel =
    Provider.of<HomePageViewModel>(context);
    return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(totalAmount,
            style: MyStyle.getMediumBlackText(context)),
        const SizedBox(
          width: 20.0,
        ),
        Chip(
            backgroundColor: whiteColor,
            shadowColor: chipShadow,
            elevation: 5.0,
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            label: Text(homePageViewModel.totalVal.toString()))
      ],
    );
  }
}

// cash card widget
class CashCardWidget extends StatelessWidget {
  const CashCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageViewModel homePageViewModel =
    Provider.of<HomePageViewModel>(context);
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(paymentType),
        SizedBox(
          width: 100,
          child: IconButton(
            onPressed: () {
              homePageViewModel.changeCashCard();
            },
            icon: Row(
              children:  [
                Icon(
                  !homePageViewModel.cashClicked?
                  CupertinoIcons.circle_fill:
                  CupertinoIcons.checkmark_circle_fill,
                  color: blackColor,
                ),
                const Text(card)
              ],
            ),
          ),
        ),
        SizedBox(
          width: 100,
          child: IconButton(
            onPressed: () {  homePageViewModel.changeCashCard();},
            icon: Row(
              children:  [
                Icon(
                  homePageViewModel.cashClicked?
                  CupertinoIcons.circle_fill:
                  CupertinoIcons.checkmark_circle_fill,
                  color: blackColor,
                ),
                const Text(cash)
              ],
            ),
          ),
        )
      ],
    );
  }
}
