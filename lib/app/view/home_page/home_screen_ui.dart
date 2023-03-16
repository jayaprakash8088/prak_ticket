// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:park_proj/app/utils/app_config.dart';
import 'package:park_proj/app/view/home_page/chip_widget.dart';
import 'package:park_proj/app/view/home_page/home_widgets.dart';
import 'package:park_proj/app/view/login/login_page.dart';
import 'package:provider/provider.dart';

import '../../utils/my_colors.dart';
import '../../utils/my_strings.dart';
import '../../utils/my_style.dart';
import '../../view_model/home_page_view_model.dart';
import '../common_widgets.dart';
import '../payment_success_screen.dart';

class HomeScreenUI extends StatelessWidget {
  const HomeScreenUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageViewModel homePageViewModel =
        Provider.of<HomePageViewModel>(context);
    return homePageViewModel.hasValue
        ? WillPopScope(
            onWillPop: () async {
              return (await _showAlertDialog(
                    context,homePageViewModel
                  )) ??
                  false;
            },
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // dynamic route = MaterialPageRoute(
                            //     builder: (context) => const ScanQRScreen());
                            // Navigator.push(context, route);
                            _showAlertDialog(context,homePageViewModel);
                          },
                          child: const Icon(Icons.logout,
                              color: blackColor, size: 24.0),
                        ),
                        Text(issueTicket,
                            style: MyStyle.getLargeBlueText(context),
                            textAlign: TextAlign.end),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const ChipWidget(title: adult, pos: 0),
                    const ChipWidget(title: child, pos: 1),
                    const ChipWidget(title: cycle, pos: 2),
                    const ChipWidget(title: bike, pos: 3),
                    const ChipWidget(title: car, pos: 4),
                    const ChipWidget(title: miniBus, pos: 5),
                    const ChipWidget(title: largeBus, pos: 6),
                    const ChipWidget(title: camera, pos: 7),
                    const ChipWidget(title: other, pos: 8),
                    const TotalCostWidget(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Material(
                      elevation: 3.0,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                      child: SizedBox(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: TextField(
                          controller: homePageViewModel.mobileNumberController,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: InputDecoration(
                              counter: const Offstage(),
                              contentPadding: const EdgeInsets.all(5.0),
                              hintText: mobileNumber,
                              hintStyle: MyStyle.getGrayText(context),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const CashCardWidget(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                        onTap: () async {
                          if (homePageViewModel.mobileNumberController.text
                                  .trim()
                                  .isNotEmpty &&
                              homePageViewModel.mobileNumberController.text
                                      .trim()
                                      .length ==
                                  10) {
                            if (homePageViewModel.totalQuantity > 0) {
                              AppConfig.dialog(context, pleaseWait);
                              dynamic val =
                                  await homePageViewModel.saveTicket();
                              if (val != null && val) {
                                dynamic route = MaterialPageRoute(
                                    builder: (context) =>
                                        const PaymentSuccessScreen());
                                Navigator.push(context, route);
                              } else {
                                Navigator.pop(context);
                                AppConfig.showToast(somethingWrong);
                              }
                            } else {
                              AppConfig.showToast(addValues);
                            }
                          } else {
                            AppConfig.showToast(enterNumber);
                          }
                        },
                        child: const MyButton(text: bookTicket))
                  ],
                ),
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  _showAlertDialog(
    BuildContext context, HomePageViewModel homePageViewModel,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SharedAlertDialog(
            cancelText: "No",
            titleText: "Do you want to exit ?",
            confirmText: "Yes",
            onTappingCancel: () {
              Navigator.pop(context);
            },
            onTappingConfirm: () {
              homePageViewModel.clearValues();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false);
            });
      },
    );
  }
}
