import 'package:app_project/Utils/device/helper_function.dart';
import 'package:app_project/Utils/popups/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class FullScreenLoader {
  static void openDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (context) => PopScope(
          canPop: false,
            child: Container(
              color: sHelperFunction.isDarkMode(Get.context!) ? Colors.black : Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 250,),
                  SImageLoaderWidget(text: text, image: animation),
                ],
              ),
            ))
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // Close the dialog using the Navigator
  }
}