// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:park_proj/app/utils/app_config.dart';
import 'package:park_proj/app/utils/my_assets.dart';
import 'package:park_proj/app/utils/my_strings.dart';
import 'package:park_proj/app/view/common_widgets.dart';
import 'package:park_proj/app/view/ticket_screen/ticket_page.dart';
import 'package:provider/provider.dart';

import '../utils/my_colors.dart';
import '../utils/my_style.dart';
import '../view_model/home_page_view_model.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageViewModel homePageViewModel =
    Provider.of<HomePageViewModel>(context,listen: false);
    return SafeArea(child:Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child:   GestureDetector(
                  onTap: () {

                  },
                  child:
                  const Icon(Icons.menu, color: blackColor, size: 24.0),
                ),
              ),
              const SizedBox(height: 50.0,),
              Text(paymentSuccessful,
              style: MyStyle.getMediumLargeBlackText(context),),
              const SizedBox(height: 16.0,),
              Text('$totalAmount : ${homePageViewModel.totalVal.toString()}',
              style: MyStyle.getMediumBlackText(context)),
              const SizedBox(height: 16.0,),
              SizedBox(width: MediaQuery.of(context).size.width*0.7,
              height: 70.0,
              child: Text(transSuccessFull,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: MyStyle.getGreenText(context)),),
              const SizedBox(height: 16.0,),
              Image.asset(tick),
              const SizedBox(height: 50.0,),
              GestureDetector(
                  onTap: ()async{
                    AppConfig.dialog(context,pleaseWait+takeTime);
                    await homePageViewModel.loadBytes();
                    dynamic newRoute=MaterialPageRoute(builder: (context)=>const TicketPage());
                    Navigator.pushAndRemoveUntil(context, newRoute, (route) => false);
                  },
                  child: const MyButton(text:previewTicket,))
            ],
          ),
        ),
      ),
    ) );
  }
}
