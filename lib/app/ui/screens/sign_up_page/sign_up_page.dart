//Packges
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:user_app/app/controllers/auth_controller/auth_controller.dart';
import 'package:user_app/app/ui/screens/login_page/login_page.dart';
import 'package:user_app/app/ui/widgets/common_app_bar.dart';
import 'package:user_app/app/ui/widgets/common_button.dart';

import '../../../config/MyColors.dart';
import '../../widgets/common_text_button.dart';
import '../../widgets/common_textform_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AuthController(),
        initState: (_) {
          AuthController.to.signupTextFieldClearInit();
        },
        builder: (data) {
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
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          size: 28,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/svgs/login.svg",
                      width: Get.width,
                      height: 300,
                    ),
                    Form(
                        key: AuthController.to.signupFormKey,
                        child: Column(
                          children: [
                            CommonTextFormField(
                              hintText: "Enter your Name",
                              labelText: "Name",
                              controller: AuthController.to.nameController,
                              validator: (data) {
                                if (data == null || data.isEmpty) {
                                  return 'Name Field is Required';
                                } else if (data.length <= 3) {
                                  return 'Name must be 3 Character';
                                }
                                return null;
                              },
                            ),
                            CommonTextFormField(
                              hintText: "Enter your email",
                              labelText: "Email",
                              controller: AuthController.to.emailController,
                              validator: (data) {
                                if (data == null || data.isEmpty) {
                                  return 'Email Field is Required';
                                }
                                return null;
                              },
                            ),
                            CommonTextFormField(
                              hintText: "Enter your Phone Number",
                              labelText: "Phone",
                              maxLength: 10,
                              keyboardType: TextInputType.phone,
                              controller: AuthController.to.phoneController,
                              validator: (data) {
                                if (data == null || data.isEmpty) {
                                  return 'Phone Number Field is Required';
                                } else if (data.length <= 10) {
                                  return 'Phone number must be 10';
                                }
                                return null;
                              },
                            ),
                            CommonTextFormField(
                              hintText: "Enter your Password",
                              labelText: "Password",
                              controller: AuthController.to.passwordController,
                              validator: (data) {
                                if (data == null || data.isEmpty) {
                                  return 'Password Field is Required';
                                } else if (data.length <= 8) {
                                  return 'Password must be 8 Character';
                                }
                                return null;
                              },
                            ),
                            CommonTextFormField(
                              hintText: "Enter your Confirm_password",
                              labelText: "Confirm Password",
                              controller: AuthController.to.confirmPasswordController,
                              validator: (data) {
                                if (data == null || data.isEmpty) {
                                  return 'Confirm Password Field is Required';
                                } else if (data.length <= 8) {
                                  return 'Confirm Password must be 8 Character';
                                } else if (data !=
                                    AuthController.to.passwordController.text) {
                                  return 'Password must be same';
                                }
                                return null;
                              },
                            ),
                          ],
                        )),
                    CommonButton(
                      text: "Register",
                      onPressed: () {
                        if (AuthController.to.signupFormKey.currentState!
                            .validate()) {
                          print("All details filled");
                          AuthController.to.register();
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonTextButton(
                            text: "Already have an account SignIn?",
                            onTap: () {
                              Get.to(LoginPage());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
    );
  }
}
