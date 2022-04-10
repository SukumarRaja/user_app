//Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/MyColors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? appBarName;
  final Function()? onPressed;
  final Function()? onFilterPressed;
  final IconData? filterIcon;
  final Function()? onTapDownload;
  final Widget? customSwitch;
  final Widget? back;
  @override
  final Size preferredSize;
  final IconData? downloadIcon;
  const CommonAppBar(
      {this.appBarName,
      this.onTapDownload,
      this.onPressed,
      this.filterIcon,
      this.onFilterPressed,
      this.downloadIcon,
      this.customSwitch,
      this.back})
      : preferredSize = const Size.fromHeight(120.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: 30.0,
          width: Get.width,
          decoration: const BoxDecoration(
            color: AppColors.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.white,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(color: Colors.transparent, child: back),
                Text(
                  appBarName!,
                  style: const TextStyle(
                      fontSize: 20.0,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                InkWell(
                  child: Icon(downloadIcon,
                      size: 30.0, color: AppColors.primaryColor),
                  onTap: onTapDownload,
                ),
                InkWell(
                  child: Icon(filterIcon,
                      size: 30.0, color: AppColors.primaryColor),
                  onTap: onFilterPressed,
                ),
                Container(
                  color: Colors.transparent,
                  child: customSwitch,
                ),
              ],
            ),
          )),
    );
  }
}
