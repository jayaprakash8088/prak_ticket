import 'package:flutter/material.dart';
import 'package:park_proj/app/utils/my_style.dart';
import 'package:park_proj/app/view/home_page/my_custom_chip.dart';
import 'package:park_proj/app/view_model/home_page_view_model.dart';
import 'package:provider/provider.dart';

import '../../utils/my_colors.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({Key? key, required this.title, required this.pos})
      : super(key: key);
  final String title;
  final int pos;

  @override
  Widget build(BuildContext context) {
    HomePageViewModel homePageViewModel =
        Provider.of<HomePageViewModel>(context);
    return SizedBox(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 100.0,
              child: Text(
                title,
                style: MyStyle.getMediumBlackText(context),
              )),
          MyCustomChip(pos: pos),
          Chip(
              backgroundColor: whiteColor,
              shadowColor: chipShadow,
              elevation: 10.0,
              padding: const EdgeInsets.only(
                  top: 5.0, bottom: 5.0, right: 5.0, left: 5.0),
              label: SizedBox(
                  width: 35.0,
                  child: Text(homePageViewModel.getTotalValue(pos),textAlign: TextAlign.center,)))
        ],
      ),
    );
  }
}
