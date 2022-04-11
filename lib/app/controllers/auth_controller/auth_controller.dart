//Packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/app/config/MyColors.dart';
import 'package:user_app/app/data/repository/http/auth_repository/auth_repository.dart';
import 'package:user_app/app/ui/screens/home_page/home_page.dart';
import 'package:user_app/app/ui/widgets/common_error_popup.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.put(AuthController());
  final repository = AuthRepository();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference reference = FirebaseDatabase.instance.ref().child("users");

  final signupFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  signupTextFieldClearInit() {
    nameController.text = "";
    emailController.text = "";
    phoneController.text = "";
    passwordController.text = "";
    confirmPasswordController.text = "";
  }

  void register() async {
    const CircularProgressIndicator(
      strokeWidth: 2,
      color: AppColors.primaryColor,
    );
    final User? credential = (await firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .catchError((msg) {
      print("Error" + msg.toString());
    }))
        .user;
    if (credential != null) {
      Map bodyData = {
        "name": nameController.text,
        "phone": phoneController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "confirm_password": confirmPasswordController.text
      };
      reference.child(credential.uid).set(bodyData);
      Get.to(const HomePage());
      commonErrorPopUp(Get.context!, content: "Successfully Registered");
      if (kDebugMode) {
        print("Successfully Registered");
      }
    }

    if (kDebugMode) {
      print("user credentials $credential");
    }
  }

  login() async {
    commonErrorPopUp(Get.context!, content: "Login Successfully");
  }
}
