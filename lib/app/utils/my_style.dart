import 'package:flutter/material.dart';
import 'package:park_proj/app/utils/my_colors.dart';

class MyStyle {
  static getMediumWhite(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: whiteColor, fontSize: 16.0, fontWeight: FontWeight.w700);
  }
  static getSmallWhite(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: whiteColor, fontSize: 14.0, fontWeight: FontWeight.w700);
  }
  static getMediumBoldWhite(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: whiteColor, fontSize: 20.0, fontWeight: FontWeight.w700);
  }
  //light gray text
  static getLightGrayText(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: lightGrayColor, fontSize: 16.0, fontWeight: FontWeight.w400);
  }
  static getGrayText(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: grayColor, fontSize: 16.0, fontWeight: FontWeight.w400);
  }
  static getGrayText1(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: grayColor, fontSize: 14.0, fontWeight: FontWeight.w600);
  }
  // light black text
  static getLightBlackText(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: blackTextColor, fontSize: 16.0, fontWeight: FontWeight.w600);
  }
  static getMediumBlackText(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: blackTextColor, fontSize: 18.0, fontWeight: FontWeight.w600);
  }
  static getMediumLargeBlackText(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: blackTextColor, fontSize: 22.0, fontWeight: FontWeight.w600);
  }
  static getLargeBlueText(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: blueColor, fontSize: 28.0, fontWeight: FontWeight.w700);
  }
  static getGreenText(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: lightGreen, fontSize: 14.0, fontWeight: FontWeight.w400);
  }

}
