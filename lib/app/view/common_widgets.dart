import 'package:flutter/material.dart';
import 'package:park_proj/app/utils/my_colors.dart';
import 'package:park_proj/app/utils/my_style.dart';

import '../utils/my_assets.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {Key? key,
      required this.controller,
      required this.forVenue,
      required this.hint})
      : super(key: key);
  final TextEditingController controller;
  final bool forVenue;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: forVenue
            ? const Icon(
                Icons.search,
                color: blackColor,
                size: 18.0,
              )
            : const SizedBox(),
        hintText: hint,
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: blueColor,
          borderRadius: BorderRadius.all(Radius.circular(6.0))),
      child: Center(child: Text(text, style: MyStyle.getMediumWhite(context))),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(logo);
  }
}

class LoginDetails extends StatelessWidget {
  const LoginDetails(
      {Key? key,
      required this.title,
      required this.value,
      required this.fromCard})
      : super(key: key);
  final String title;
  final String value;
  final bool fromCard;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: Row(children: [
        SizedBox(
          width: fromCard
              ? MediaQuery.of(context).size.width * 0.3
              : MediaQuery.of(context).size.width * 0.4,
          child: Text(
            title,
            softWrap: true,
            textAlign: TextAlign.start,
            style: MyStyle.getLightGrayText(context),
          ),
        ),
        SizedBox(
          width: fromCard
              ? MediaQuery.of(context).size.width * 0.3
              : MediaQuery.of(context).size.width * 0.4,
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: MyStyle.getLightBlackText(context),
          ),
        ),
      ]),
    );
  }
}

//UiAlertDialog

class SharedAlertDialog extends StatelessWidget {
  final String cancelText;
  final String confirmText;
  
  final String titleText;
  final VoidCallback onTappingCancel;
  final VoidCallback onTappingConfirm;

  const SharedAlertDialog(
      {super.key,
      required this.cancelText,
      required this.confirmText,
     
      required this.onTappingCancel,
      required this.onTappingConfirm,
      required this.titleText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titleText),
     
      actions: [
        TextButton(
          onPressed: onTappingCancel,
          child: Text(cancelText, style: const TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: onTappingConfirm,
          child: Text(confirmText, style: const TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
