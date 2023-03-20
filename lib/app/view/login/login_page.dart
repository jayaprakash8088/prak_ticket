// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:park_proj/app/utils/app_config.dart';
import 'package:park_proj/app/utils/my_strings.dart';
import 'package:park_proj/app/view/common_widgets.dart';
import 'package:park_proj/app/view/login/login_detail_page.dart';
import 'package:park_proj/app/view/login/venue_drop_down.dart';
import 'package:park_proj/app/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel =
        Provider.of<LoginViewModel>(context, listen: false);
    viewModel.getVenue();
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              const Center(child: AppLogo()),
              const SizedBox(
                height: 50.0,
              ),
              const VenueDropdown(),
              const SizedBox(
                height: 20.0,
              ),
              MyTextField(
                  controller: viewModel.employeeId,
                  forVenue: false,
                  hint: empId),
              const SizedBox(
                height: 20.0,
              ),
              MyTextField(
                  controller: viewModel.password,
                  forVenue: false,
                  hint: password),
              const SizedBox(
                height: 40.0,
              ),
              GestureDetector(
                onTap: () async {
                  if (viewModel.venueController.text != '' &&
                      viewModel.employeeId.text.isNotEmpty &&
                      viewModel.password.text.isNotEmpty) {
                      if (viewModel.validatePassword()) {
                        AppConfig.dialog(context, pleaseWait);
                        var value = await viewModel.callLoginApi();
                        if (value != null && value) {
                          Navigator.pop(context);
                          dynamic newRoute = MaterialPageRoute(
                              builder: (context) => const LoginDetailPage());
                          Navigator.pushAndRemoveUntil(
                              context, newRoute, (route) => false);
                        } else {
                          AppConfig.showToast(somethingWrong);
                          Navigator.pop(context);
                        }
                      } else {
                        AppConfig.showToast('Please enter valid password');
                      }
                  } else {
                    AppConfig.showToast('Please fill all  fields');
                  }
                },
                child: const MyButton(
                  text: login,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
