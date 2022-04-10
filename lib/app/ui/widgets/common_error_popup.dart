import 'package:flutter/material.dart';
import 'package:get/get.dart';

commonErrorPopUp(BuildContext context, {required String content}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        contentPadding: const EdgeInsets.only(top: 10.0),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.red,
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Alert",
                  style: TextStyle(fontSize: 24.0),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Divider(
              color: Colors.grey,
              height: 4.0,
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 50, bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(content),
                  ],
                )),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent.withAlpha(170),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                      bottomRight: Radius.circular(32.0)),
                ),
                child: const Text(
                  "Dismiss",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
