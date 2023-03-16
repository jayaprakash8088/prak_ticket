import 'package:flutter/material.dart';
import 'package:park_proj/app/utils/my_strings.dart';
import 'package:park_proj/app/view/login/splash_screen.dart';
import 'package:park_proj/app/view_model/login_view_model.dart';
import 'package:park_proj/app/view_model/qr_view_model.dart';
import 'package:park_proj/app/view_model/valid_ticket_view_model.dart';
import 'package:provider/provider.dart';

import 'app/view_model/home_page_view_model.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>LoginViewModel()),
    ChangeNotifierProvider(create: (_)=>HomePageViewModel()),
    ChangeNotifierProvider(create: (_)=>QRViewModel()),
    ChangeNotifierProvider(create: (_)=>ValidTicketViewModel()),
  ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home:SplashScreen(),
    );
  }
}

