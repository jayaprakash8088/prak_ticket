import 'package:flutter/material.dart';
import 'package:park_proj/app/models/save_ticket_info.dart';
import 'package:park_proj/app/utils/my_colors.dart';
import 'package:park_proj/app/utils/my_strings.dart';
import 'package:park_proj/app/utils/my_style.dart';
import 'package:park_proj/app/view/valid_ticket/ticket_list.dart';

import '../../utils/my_assets.dart';
import '../common_widgets.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Card(
          elevation: 5.0,
          shadowColor: chipShadow,
          color: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:5.0,top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 10.0,),
                Text(bookingDetails,style: MyStyle.getLightBlackText(context),),
                const LoginDetails(title: date, value: '22-2-2023',fromCard: true),
                const LoginDetails(title: checkIn, value: '11:00 am',fromCard: true),
                const LoginDetails(title: paymentType, value: 'Cash',fromCard: true),
                const LoginDetails(title: venue, value: 'Chennai',fromCard: true),
               // TicketList(SaveTicketInfo())
              ],
            ),
          ),
        ),
        Positioned(
          top: -20.0,
          child: Image.asset(smallTick,height: 40.0,width: 40.0,),
        )
      ],
    );
  }
}
