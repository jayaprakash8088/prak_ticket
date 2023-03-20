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
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  bookingDetails,
                  style: MyStyle.getLightBlackText(context),
                ),
                Text(
                  validForOne,
                  style: MyStyle.getLightGrayText(context),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemCount: homePageViewModel
                        .ticketInfoResponseModel!
                        .qrResponses!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              children: [
                                Image.memory(
                                  homePageViewModel
                                      .pngBytes[index],
                                  width:
                                  MediaQuery.of(context).size.width * 0.25,
                                  height:
                                  MediaQuery.of(context).size.height * 0.25,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    LoginDetails(
                                        title: date,
                                        value: AppConfig.date
                                            .format(AppConfig.now),
                                        fromCard: true),
                                    LoginDetails(
                                        title: checkIn,
                                        value: AppConfig.time
                                            .format(AppConfig.now),
                                        fromCard: true),
                                    LoginDetails(
                                        title: paymentType,
                                        value: !homePageViewModel.cashClicked
                                            ? cash
                                            : card,
                                        fromCard: true),
                                    LoginDetails(
                                        title: venue,
                                        value: homePageViewModel
                                            .venueValue,
                                        fromCard: true),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  width: 100.0,
                                  child: Text(
                                    homePageViewModel.ticketInfoResponseModel!
                                        .qrResponses![index].ticketName!,
                                    style: MyStyle.getMediumBlackText(context),
                                  )),
                              const Chip(
                                  backgroundColor: whiteColor,
                                  shadowColor: chipShadow,
                                  elevation: 10.0,
                                  padding: EdgeInsets.only(
                                      top: 5.0,
                                      bottom: 5.0,
                                      right: 20.0,
                                      left: 20.0),
                                  label: Text('01')),
                               Chip(
                                  backgroundColor: whiteColor,
                                  shadowColor: chipShadow,
                                  elevation: 10.0,
                                  padding: const EdgeInsets.only(
                                      top: 5.0,
                                      bottom: 5.0,
                                      right: 20.0,
                                      left: 20.0),
                                  label: Text(  homePageViewModel.ticketInfoResponseModel!
                                      .qrResponses![index].amount!.toString())),
                            ],
                          ),
                        ],
                      );
                    }),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () async {
                    AppConfig.dialog(context, pleaseWait);
                    homePageViewModel.printDoc(context);
                  },
                  child: const MyButton(text: print),
                ),
                const SizedBox(
                  height: 10.0,
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
