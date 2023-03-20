// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:park_proj/app/utils/app_config.dart';
import 'package:park_proj/app/view/common_widgets.dart';
import 'package:provider/provider.dart';
import '../../utils/my_assets.dart';
import '../../utils/my_colors.dart';
import '../../utils/my_strings.dart';
import '../../utils/my_style.dart';
import '../../view_model/login_view_model.dart';
import '../home_page/home_screen.dart';
import '../scar_qr/scan_qr_page.dart';

class LoginDetailUI extends StatelessWidget {
  const LoginDetailUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = Provider.of<LoginViewModel>(context);
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50.0,
            ),
            const AppLogo(),
            const SizedBox(
              height: 10.0,
            ),
            LoginDetails(
                title: venue,
                value: viewModel.venueController.text,
                fromCard: false),
            const SizedBox(
              height: 10.0,
            ),
            LoginDetails(
                title: eId,
                value: viewModel.empDetailResponseModel!.empid!,
                fromCard: false),
            const SizedBox(
              height: 10.0,
            ),
            LoginDetails(
                title: eName,
                value: viewModel.empDetailResponseModel!.employee_Name!,
                fromCard: false),
            const SizedBox(
              height: 10.0,
            ),
            LoginDetails(
                title: number,
                value: viewModel.empDetailResponseModel!.user_Code!,
                fromCard: false),
            const SizedBox(
              height: 10.0,
            ),
            LoginDetails(
                title: shift, value: viewModel.getShift(), fromCard: false),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 155.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ePhoto,
                      style: MyStyle.getLightGrayText(context),
                    ),
                    Consumer(builder: (_, a, child) {
                      return GestureDetector(
                        onTap: ()  {
                          kIsWeb?viewModel.uploadImage():
                          viewModel.getImage(ImageSource.camera);
                        },
                        child: Container(
                          height: 150.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: blackColor, width: 2.0)),
                          child: viewModel.hasImage
                              ? !kIsWeb?
                          Image.file(
                            File(viewModel.imageFile!.path),
                            fit: BoxFit.cover,
                          ):Image.memory(viewModel.webImage!)
                              : Image.asset(cameraImage),
                        ),
                      );
                    })
                  ]),
            ),
            const SizedBox(
              height: 40.0,
            ),
            GestureDetector(
                onTap: () async {
                  if (viewModel.hasImage) {
                    AppConfig.dialog(context, pleaseWait);
                    dynamic val = await viewModel.saveEmployeeDetails(kIsWeb);
                    if (val != null && val) {
                      Navigator.pop(context);
                      viewModel.hasImage=false;
                      dynamic homeScreen = MaterialPageRoute(
                          builder: (context) => const HomeScreen());
                      dynamic scan = MaterialPageRoute(
                          builder: (context) => const ScanQRScreen());
                      var value =
                          viewModel.empDetailResponseModel!.user_Type != null &&
                              viewModel.empDetailResponseModel!.user_Type!
                                      .toLowerCase() ==
                                  scanner.toLowerCase();
                      await Navigator.pushAndRemoveUntil(
                          context, value ? scan : homeScreen, (route) => false);
                    } else {
                      Navigator.pop(context);
                      AppConfig.showToast(somethingWrong);
                    }
                  } else {
                    AppConfig.showToast(uploadImg);
                  }
                },
                child: const MyButton(
                  text: submit,
                ))
          ],
        ),
      ),
    );
  }
}
