
import 'package:app_project/Utils/device/device_utility.dart';
import 'package:app_project/Utils/device/helper_function.dart';
import 'package:flutter/material.dart';

class sTabBar extends StatelessWidget implements PreferredSizeWidget{
  const sTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = sHelperFunction.isDarkMode(context);
    return Material(
      color: dark ? Colors.black : Colors.white,
      child: TabBar(
          isScrollable: true,
          indicatorColor: Colors.red,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.red,
          tabs: tabs
      ),
    );

  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());

}