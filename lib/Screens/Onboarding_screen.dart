

import 'package:app_project/Data/Controller/OnBoarding_controller.dart';
import 'package:app_project/Screens/Home/Home_Screen.dart';
import 'package:app_project/Screens/Login_pg.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final introkey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    final pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 19,),
      bodyPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      key: introkey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Shop Now",
          body: "a call to action encouraging immediate purchase or "
              "browsing of goods and services,"
              " often used in online retail or marketing campaigns ",
          image: Image.asset("Assets/Images/splash3.png", width: 200,),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Big Discount",
          body: "a substantial reduction in the usual price of a product or service",
          image: Image.asset("Assets/Images/splash6.png", width: 200,),
          decoration: pageDecoration,
        ),
        PageViewModel(
            title: "Free Delivery",
            body: "the seller covers the cost of shipping or delivery to the customer",
            image: Image.asset("Assets/Images/splash5.png", width: 200,),
            decoration: pageDecoration,
            footer: Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 50),
              child: ElevatedButton(
                  onPressed: () => controller.nextPage(),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(55),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),),
                  child: Text(
                      "Let's Shop",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )
                  )
              ),
            )
        )
      ],
      showSkipButton: false,
      showDoneButton: false,
      showBackButton: true,
      back: Text(
        'Back',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.red,
        ),),
      next: Text(
        'Next',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.red,
        ),),
      onDone: (){},
      onSkip: (){},
      dotsDecorator: DotsDecorator(
          size: Size.square(10),
          activeSize: Size(20, 10),
          activeColor: Colors.orange,
          color: Colors.black26,
          spacing: EdgeInsets.symmetric(horizontal: 3),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          )
      ),
    ) ;
  }
}
