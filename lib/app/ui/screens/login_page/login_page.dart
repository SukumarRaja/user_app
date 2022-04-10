//Packges
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:user_app/app/controllers/auth_controller/auth_controller.dart';
import 'package:user_app/app/ui/screens/forgot_password_page/forgot_password.dart';
import 'package:user_app/app/ui/screens/sign_up_page/sign_up_page.dart';
import 'package:user_app/app/ui/widgets/common_button.dart';
import 'package:user_app/app/ui/widgets/common_text_button.dart';

import '../../widgets/common_divider.dart';
import '../../widgets/common_text.dart';
import '../../widgets/common_textform_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white.withAlpha(110),
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/svgs/login.svg",
                width: Get.width,
                height: 300,
              ),
              Form(
                key: AuthController.to.loginFormKey,
                child: Column(
                  children: [
                    CommonTextFormField(
                      hintText: "Enter your email",
                      labelText: "Email",
                      controller: AuthController.to.loginEmailController,
                      validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'Email Field is Required';
                        }
                        return null;
                      },
                    ),
                    CommonTextFormField(
                      hintText: "Enter your Password",
                      labelText: "Password",
                      obscureText: true,
                      controller: AuthController.to.loginPasswordController,
                      validator: (data) {
                        if (data == null || data.isEmpty) {
                          return 'Password Field is Required';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CommonTextButton(
                      text: "Forgot Password?",
                      onTap: () {
                        Get.to(ForgotPasswordPage());
                      },
                    ),
                  ],
                ),
              ),
              CommonButton(
                text: "Login",
                onPressed: () {
                  if (AuthController.to.loginFormKey.currentState!.validate()) {
                    AuthController.to.login();
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonTextButton(
                    text: "Don't have an account Signup?",
                    onTap: () {
                      Get.to(SignUpPage());
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
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
              CommonButton(
                text: "Signin with Google",
                onPressed: () {
                  // Get.to(
                  //   HomePage(),
                  // );
                },
                sizedBoxWidth: 10,
                child: SvgPicture.asset(
                  "assets/svgs/google.svg",
                  width: 30,
                  height: 30,
                ),
              ),
              CommonButton(
                text: "Signin with Facebook",
                onPressed: () {
                  // Get.to(
                  //   HomePage(),
                  // );
                },
                sizedBoxWidth: 10,
                child: SvgPicture.asset(
                  "assets/svgs/face_book.svg",
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
