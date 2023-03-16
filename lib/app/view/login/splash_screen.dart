// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:park_proj/app/utils/app_config.dart';
import 'package:park_proj/app/utils/app_shared_pref.dart';
import 'package:park_proj/app/view/login/login_detail_page.dart';
import 'package:park_proj/app/view/login/login_page.dart';

import '../../utils/my_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2),()async{
      dynamic val=await AppSharedPref().getIsLogged();
      if(val!=null&&val){
        dynamic val=await AppSharedPref().getShift();
        if(val!=''){
          if(val=='A'){
          if(AppConfig.now.hour>=8&&AppConfig.now.hour<14){
            goToDetailPage(context);
            goToLoginPage(context);
          }else{
            goToLoginPage(context);
          }
          }else{
            if(AppConfig.now.hour>=14&&AppConfig.now.hour<20){
              goToDetailPage(context);
              goToLoginPage(context);
            }else{
              goToLoginPage(context);
            }
          }
        }
        else{
          goToLoginPage(context);
        }

      }else{
        goToLoginPage(context);
      }
    });
    return  Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height ,
        child: Center(
          child: Image.asset(logo),
        ),
      ),
    );
  }
  dynamic goToDetailPage(BuildContext context){
    dynamic loginPage=MaterialPageRoute(builder: (context)=>const LoginDetailPage());
    Navigator.pushAndRemoveUntil(context, loginPage, (route) => false);
  }
  dynamic goToLoginPage(BuildContext context){
    dynamic loginPage=MaterialPageRoute(builder: (context)=>const LoginPage());
    Navigator.pushAndRemoveUntil(context, loginPage, (route) => false);
  }
}
