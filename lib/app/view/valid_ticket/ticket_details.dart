import 'package:flutter/material.dart';
import 'package:park_proj/app/utils/my_strings.dart';
import 'package:park_proj/app/utils/my_style.dart';
import 'package:provider/provider.dart';

import '../../utils/my_assets.dart';
import '../../utils/my_colors.dart';
import '../../view_model/home_page_view_model.dart';
import '../common_widgets.dart';
import '../home_page/home_screen.dart';

class TicketDetails extends StatelessWidget {
  const TicketDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageViewModel homePageViewModel =
    Provider.of<HomePageViewModel>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child:
                        const Icon(Icons.menu, color: blackColor, size: 24.0),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(validTicket,
                  style: MyStyle.getMediumLargeBlackText(context)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 50.0,
                child: Text(
                  validSuccess,
                  style: MyStyle.getGrayText1(context),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Image.asset(
                smallTick,
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              GestureDetector(
                onTap: () async {
                  homePageViewModel.clearValues();
                  dynamic route = MaterialPageRoute(
                      builder: (context) =>  const HomeScreen());
                  Navigator.pushAndRemoveUntil(context,route, (route) => false);
                },
                child: const MyButton(text: backToHomeScreen),
              )
            ],
          ),
        ),
      ),
    );
  }
}
