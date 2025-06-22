import 'package:app_project/Screens/store/Store_Screen.dart';
import 'package:app_project/Utils/device/helper_function.dart';
import 'package:flutter/material.dart';

class sVerticalImageText extends StatelessWidget {
  const sVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String title;
  final String image;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = sHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Circular_image(
                image: image,
              fit: BoxFit.fitWidth,
              padding: 8 * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? Colors.white : Colors.black,
            ),
            // Container(
            //   width: 85,
            //   height: 32,
            //   padding: const EdgeInsets.all(8.0),
            //   decoration: BoxDecoration(
            //     color: backgroundColor,
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Center(
            //     child: Image(image: AssetImage(image),
            //       fit: BoxFit.cover,),
            //   ),
            //   // child: Center(
            //   //   child: Text(
            //   //     title,
            //   //     style: TextStyle(color: textColor,fontSize: 15),
            //   //     maxLines: 1,
            //   //     overflow: TextOverflow.ellipsis,
            //   //   ),
            //   // ),
            // ),
            SizedBox(height: 5.0 / 2,),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: TextStyle(color: textColor,fontSize: 15),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}