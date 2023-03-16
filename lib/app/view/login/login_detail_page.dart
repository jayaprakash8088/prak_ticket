import 'package:flutter/material.dart';
import 'package:park_proj/app/view/login/login_detail_ui.dart';
import 'package:park_proj/app/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginDetailPage extends StatelessWidget {
  const LoginDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel =
        Provider.of<LoginViewModel>(context, listen: false);
    viewModel.getEmpDetails();
    return SafeArea(child: Scaffold(
      body: StreamBuilder(
          stream: viewModel.employeeDetails.stream,
          builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return const LoginDetailUI();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    ));
  }
}
