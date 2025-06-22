import 'package:app_project/Screens/Bottom_Navigation_Screen.dart';
import 'package:app_project/Screens/CheckOut/widget/billing_address_section.dart';
import 'package:app_project/Screens/CheckOut/widget/billing_amount_section.dart';
import 'package:app_project/Screens/CheckOut/widget/billing_payment_section.dart';
import 'package:app_project/Screens/Home/Home_Screen.dart';
import 'package:app_project/Screens/cart/Widget/Cart_Item.dart';
import 'package:app_project/Screens/success_screen.dart';
import 'package:app_project/Utils/device/helper_function.dart';
import 'package:app_project/common/Images/sImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final dark = sHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Review',style: Theme.of(context).textTheme.headlineSmall,),
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(24),
          child: Column(
            children: [


              CartItem(showAddRemoveButtons: false,),
              SizedBox(height: 32,),
              
              // Coupon textField
              CouponCode(),
              SizedBox(height: 32,),
              
            //   Billing
              RounderContainer(
                showBorder: true,
                padding: EdgeInsets.all(16),
                backgroundColor: dark ? Colors.black : Colors.white,
                child: Column(
                  children: [
                    
                  //   Pricing
                    BillingAmountSection(),
                    SizedBox(height: 16,),
                  
                  //   Divider
                    Divider(),
                  SizedBox(height: 16,),
                  
                  //   Payment Method
                    BillingPaymentSection(),
                    SizedBox(height: 16,),

                  //   address
                    BillingAddressSection(),


                  ],
                ),
              )
              
            ],
        ),),
      ),

      // checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                fixedSize: Size(30, 30),
                minimumSize: Size.fromHeight(55),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
            onPressed: () => Get.to(() => SuccessScreen(
                image: sImages.paymentSuccess,
                title: 'Payment Success!',
                subtitle: 'Your item will be shipped soon!',
                onPressed: () => Get.offAll(() => BottomNavigationScreen()))),
            child: Text('Checkout \$1150',style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
    );
  }
}

class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,
   
  });
  

  @override
  Widget build(BuildContext context) {
    final dark = sHelperFunction.isDarkMode(context);
    return RounderContainer(
      showBorder: true,
      backgroundColor: dark ? Colors.black : Colors.white,
      padding: EdgeInsets.only(top: 8,bottom: 8,right: 8,left: 16),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a promo code? Enter here',
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none
              ),
            ),
          ),
          
          // Button
          SizedBox(
            width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: dark ? Colors.white.withOpacity(0.5) : Colors.black.withOpacity(0.5),
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    side: BorderSide(color: Colors.grey.withOpacity(0.2)),
                  ),
                  child: Text('Apply',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
              )
          )
        ],
      ),
    );
  }
}
