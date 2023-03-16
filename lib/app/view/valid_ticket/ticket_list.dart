import 'package:flutter/material.dart';
import 'package:park_proj/app/models/save_ticket_info.dart';
import '../../utils/my_colors.dart';
import '../../utils/my_style.dart';

class TicketList extends StatelessWidget {
  const TicketList(this.saveTicketInfo, {Key? key}) : super(key: key);
  final SaveTicketInfo saveTicketInfo;
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        scrollDirection:Axis.vertical,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: saveTicketInfo.ticketTypes!.length,
        itemBuilder: (context,index){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width:100.0,child: Text(saveTicketInfo.ticketTypes![index].name!,style: MyStyle.getMediumBlackText(context),)),
               Chip(
                  backgroundColor: whiteColor,
                  shadowColor: chipShadow,
                  elevation: 10.0,
                  padding: const EdgeInsets.only(top:5.0,bottom: 5.0,
                      right: 20.0,left: 20.0),
                  label: Text(saveTicketInfo.ticketTypes![index].quantity!.toString())),
               Chip(
                  backgroundColor: whiteColor,
                  shadowColor: chipShadow,
                  elevation: 10.0,
                  padding: const EdgeInsets.only(top:5.0,bottom: 5.0,
                      right: 20.0,left: 20.0),
                  label: Text(saveTicketInfo.ticketTypes![index].amount!.toString())),
            ],
          );
        });
  }
}
