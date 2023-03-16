// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:park_proj/app/utils/app_config.dart';
import 'package:park_proj/app/utils/my_style.dart';
import 'package:provider/provider.dart';

import '../../utils/my_colors.dart';
import '../../utils/my_strings.dart';
import '../../view_model/home_page_view_model.dart';
import '../common_widgets.dart';
import '../home_page/home_screen.dart';
import '../home_page/home_widgets.dart';
import '../scar_qr/qr_generator.dart';
import '../valid_ticket/ticket_list.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageViewModel homePageViewModel =
        Provider.of<HomePageViewModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                RepaintBoundary(
                    key: homePageViewModel.globalKey,
                    child: QrGenerator(
                        text: homePageViewModel.ticketId)),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () async {
                   await homePageViewModel.captureAndSharePng();
                    homePageViewModel.printDoc(context);
                  },
                  child: const MyButton(text: print),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  validForOne,
                  style: MyStyle.getLightGrayText(context),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Card(
                  elevation: 5.0,
                  shadowColor: chipShadow,
                  color: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          bookingDetails,
                          style: MyStyle.getLightBlackText(context),
                        ),
                        LoginDetails(
                            title: date,
                            value: AppConfig.date.format(AppConfig.now),
                            fromCard: true),
                        LoginDetails(
                            title: checkIn,
                            value: AppConfig.time.format(AppConfig.now),
                            fromCard: true),
                        LoginDetails(
                            title: paymentType,
                            value: !homePageViewModel.cashClicked ? cash : card,
                            fromCard: true),
                        LoginDetails(
                            title: venue,
                            value: homePageViewModel.saveTicketInfo!.venueId!,
                            fromCard: true),
                        TicketList(homePageViewModel.saveTicketInfo!)
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 25.0, top: 10.0),
                  child: TotalCostWidget(),
                ),
                GestureDetector(
                  onTap: () async {
                    homePageViewModel.clearValues();
                    dynamic route = MaterialPageRoute(
                        builder: (context) => const HomeScreen());
                    Navigator.pushAndRemoveUntil(
                        context, route, (route) => false);
                  },
                  child: const MyButton(text: backToHomeScreen),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
