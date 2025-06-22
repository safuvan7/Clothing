import 'package:app_project/Screens/Home/Home_Screen.dart';
import 'package:app_project/Utils/device/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = sHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders',style: Theme.of(context).textTheme.headlineSmall),
        leading: BackButton(),
      ),
      body: Padding(
          padding: EdgeInsets.all(24),
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => SizedBox(height: 16,),
          itemBuilder: (context, index) => RounderContainer(
            showBorder: true,
            padding: EdgeInsets.all(16),
            backgroundColor: dark ? Colors.black : Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // Row 1
                Row(
                  children: [

                  //   icon
                    Icon(Icons.local_shipping_outlined),
                    SizedBox(width: 16 / 2,),

                  //   Status & date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Processing',
                            style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.red,fontWeightDelta: 1),
                          ),
                          Text(
                            '07 Nov 2024',style: Theme.of(context).textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ),

                  //   Icon
                    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios,size: 16,))
                  ],
                ),
              SizedBox(height: 16,),

              //   Row 2
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [

                          //   icon
                          Icon(Iconsax.tag),
                          SizedBox(width: 16 / 2,),

                          //   Status & date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order',
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  '[#256f2]',style: Theme.of(context).textTheme.headlineSmall,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Row(
                        children: [

                          //   icon
                          Icon(Icons.calendar_month),
                          SizedBox(width: 16 / 2,),

                          //   Status & date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shipping Date',
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  '03 feb 2025',style: Theme.of(context).textTheme.headlineSmall,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),


              ],
            ),

          ),
        ),
      ),

    );
  }
}
