

import 'package:app_project/Data/Controller/OnBoarding_controller.dart';
import 'package:app_project/Screens/Home/Home_Screen.dart';
import 'package:app_project/Screens/Login_pg.dart';
import 'package:app_project/Utils/device/device_utility.dart';
import 'package:app_project/common/Images/sImages.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [

          // Horizontal scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: sImages.splash3,
                title: 'Shop Now',
                subTitle: "a call to action encouraging immediate purchase or "
                    "browsing of goods and services,"
                    " often used in online retail or marketing campaigns ",
              ),
              OnBoardingPage(
                  image: sImages.splash6,
                  title: 'Big Discount',
                  subTitle: 'a substantial reduction in the usual price of a product or service'
              ),
              OnBoardingPage(
                  image: sImages.splash5,
                  title: 'Free Delivery',
                  subTitle: 'the seller covers the cost of shipping or delivery to the customer'
              ),
            ],
          ),

          //   Skip button
          Positioned(
              top: TDeviceUtils.getAppBarHeight(),
              right: 24,
              child: TextButton(
                  onPressed: () => controller.skipPage(),
                  child: Text('Skip')
              )
          ),

          //   Dot navigation smoothPage Indicator
          Positioned(
            bottom: TDeviceUtils.getBottomNavigationBarHeight() * 25,
            left: 24,
            child: SmoothPageIndicator(
              controller: controller.pageController,
              onDotClicked: controller.dotNavigationClick,
              count: 3,
              effect: ExpandingDotsEffect(activeDotColor: Colors.red,dotHeight: 6),
            ),
          ),

          //   Circular Button
          Positioned(
              right: 24,
              bottom: TDeviceUtils.getBottomNavigationBarHeight(),
              child: ElevatedButton(
                  onPressed: () => controller.nextPage(),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Colors.red
                  ),
                  child: Icon(Icons.keyboard_arrow_right))
          )
        ],
      ),
    );
  }
}



class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image,title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Image(
              width: MediaQuery.of(Get.context!).size.width * 0.8,
              // height: MediaQuery.of(Get.context!).size.height * 0.8,
              image: AssetImage(image)),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16,),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
