import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'app/ui/screens/login_page/login_page.dart';

void main(){
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}