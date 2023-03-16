import 'package:flutter/material.dart';
import 'package:park_proj/app/view/home_page/home_screen_ui.dart';
import 'package:park_proj/app/view_model/home_page_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageViewModel homePageViewModel =
        Provider.of<HomePageViewModel>(context,listen: false);
    homePageViewModel.getTicketDetail();
    return const SafeArea(
        child: Scaffold(
      body:HomeScreenUI()
    ));
  }
}
