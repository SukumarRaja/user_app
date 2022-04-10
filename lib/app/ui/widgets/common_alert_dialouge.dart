import 'package:flutter/material.dart';
import 'package:get/get.dart';

commonAlertDialog(BuildContext context,
    {required String content, required Function() confirmButtonPressed}) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Container(
      height: 30,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.red),
      child: const Center(
        child: Text(
          "Cancel",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    ),
    onPressed: () {
      print("print");
      Get.back();
    },
  );
  Widget continueButton = TextButton(
      child: Container(
        height: 30,
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.green),
        child: const Center(
          child: Text(
            "Confirm",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
      onPressed: confirmButtonPressed);

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
    ),
    backgroundColor: Colors.grey.shade300,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
          size: 25,
        ),
        SizedBox(
          width: 10,
        ),
        Text("AlertDialog"),
      ],
    ),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          content,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
      ],
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
