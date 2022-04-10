//Packges
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:user_app/app/ui/screens/login_page/login_page.dart';
import 'package:user_app/app/ui/widgets/common_app_bar.dart';
import 'package:user_app/app/ui/widgets/common_button.dart';

import '../../../config/MyColors.dart';
import '../../widgets/common_divider.dart';
import '../../widgets/common_text.dart';
import '../../widgets/common_text_button.dart';
import '../../widgets/common_textform_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white.withAlpha(110),
          child: Column(
            children: [
              CommonAppBar(
                appBarName: "",
                back: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    size: 28,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SvgPicture.asset(
                "assets/svgs/reset.svg",
                width: Get.width,
                height: 300,
              ),
              CommonTextFormField(
                hintText: "Enter your email or Phone",
                labelText: "Phone or Email",
              ),
              CommonButton(
                text: "Get Otp",
                onPressed: () {},
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonDivider(),
                  SizedBox(
                    width: 5,
                  ),
                  CommonText(
                    text: "OR",
                    color: Colors.black,
                    size: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CommonDivider(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonTextButton(
                    text: "SignIn",
                    onTap: () {
                      Get.to(LoginPage());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
