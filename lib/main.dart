import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'app/ui/screens/login_page/login_page.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}