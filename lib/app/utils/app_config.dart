import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:park_proj/app/utils/my_assets.dart';
import 'package:park_proj/app/utils/my_colors.dart';
import 'package:intl/intl.dart';
import 'package:park_proj/app/utils/my_strings.dart';
class AppConfig {
  static var date=DateFormat('dd-m-yyyy');
  static var time=DateFormat('h:mm a');
  static var now=DateTime.now();
  static void dialog(BuildContext context, String text) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              children: <Widget>[
                const CircularProgressIndicator(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      text,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
  static dynamic dialogForScan(BuildContext context,bool isValid) {
    return  AlertDialog(
      content: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Row(
          children: [
            Image.asset(
              isValid?smallTick:failed,
            ),
            Text(
              isValid?validSuccess:invalidTicket,
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context,true);
          },
          child: const Text('Ok'),
        ),
        GestureDetector(
          onTap: (){
            Navigator.pop(context,false);
          },
          child:  const Text('Cancel'),
        )
      ],
    );
  }

  static showToast(String text) {
    return Fluttertoast.showToast(
        msg: text, backgroundColor: blackTextColor, textColor: whiteColor);
  }
}
