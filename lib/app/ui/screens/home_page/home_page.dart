//Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/app/controllers/auth_controller/auth_controller.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Text("Welcome"),
          Text(AuthController.to.nameController.text),
        ],
      ),
    );
  }
}
