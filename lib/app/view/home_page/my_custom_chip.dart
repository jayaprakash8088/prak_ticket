import 'package:flutter/material.dart';
import 'package:park_proj/app/utils/my_colors.dart';
import 'package:provider/provider.dart';

import '../../view_model/home_page_view_model.dart';

class MyCustomChip extends StatelessWidget {
  const MyCustomChip({Key? key, required this.pos}) : super(key: key);
  final int pos;
  @override
  Widget build(BuildContext context) {
    HomePageViewModel homePageViewModel =
        Provider.of<HomePageViewModel>(context);
    return Row(
      children: [
        GestureDetector(
          
          onTap: () {
            homePageViewModel.changeValue(pos, false);
          },
          child: const Material(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            color: whiteColor,
            elevation: 6.0,
            shadowColor: chipShadow,
            child: SizedBox(
              height: 30,
              width: 30,
              child: Center(
                child: Text(
                  '-',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Text(homePageViewModel.getChipValue(pos)),
        const SizedBox(
          width: 16.0,
        ),
        GestureDetector(
          onTap: () {
            homePageViewModel.changeValue(pos, true);
          },
          child: const Material(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            color: whiteColor,
            elevation: 5.0,
            shadowColor: chipShadow,
            child: SizedBox(
              height: 30,
              width: 30,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 3.0, left: 3.0),
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


/*
  Widget build(BuildContext context) {
    HomePageViewModel homePageViewModel =
        Provider.of<HomePageViewModel>(context);
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      color: whiteColor,
      elevation: 5.0,
      shadowColor: chipShadow,
      child: SizedBox(
          height: 30.0,
          width: 100.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: GestureDetector(
                  onTap: () {
                    homePageViewModel.changeValue(pos, false);
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.only(left: 3.0, right: 3.0, bottom: 3.0),
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
              Text(homePageViewModel.getChipValue(pos)),
              GestureDetector(
                onTap: () {
                  homePageViewModel.changeValue(pos, true);
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 3.0, left: 3.0),
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          )),
    );
  }
*/