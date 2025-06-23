
import 'package:app_project/Data/Controller/user_controller.dart';
import 'package:app_project/Screens/Order/My_Order.dart';
import 'package:app_project/Screens/Profile/Profile_Screen.dart';
import 'package:app_project/Screens/address/address.dart';
import 'package:app_project/Screens/cart/Cart_Screen.dart';
import 'package:app_project/Screens/store/Store_Screen.dart';
import 'package:app_project/common/widget/ListTile/setting_menu.dart';
import 'package:app_project/common/widget/appbar/appBar.dart';
import 'package:app_project/common/widget/custom_shapes/container/pimary_header_container.dart';
import 'package:app_project/common/widget/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
          //   header
            sPrimaryHeaderContainer(
                child: Column(
                  children: [
                    TAppBar(
                      title: Text('Account',
                        style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),
                      textAlign: TextAlign.center,),
                    ),
                    SizedBox(height: 32,),

                  //   user profile card
                    UserProfile(onPressed: () => Get.to(() => ProfileScreen())),
                    SizedBox(height: 32,),
                  ],
                )),

          //   body
            Padding(
                padding: EdgeInsets.all(24),
            child: Column(
              children: [
                // Account setting
                sSectionHeading(title: 'Account settings',showActionButton: false,),
                SizedBox(height: 16,),

                SettingMenu(
                  icon: Icons.location_on_outlined,
                  title: 'My Address',
                  subTitle: 'Set Shopping delivery address',
                  onTap: () => Get.to(() => UserAddressScreen()),
                ),
                SettingMenu(
                  icon: Icons.shopping_cart_outlined,
                  title: 'My Cart',
                  subTitle: 'Add, remove products and move to checkout',
                  onTap: () => Get.to(() => CartScreen()),
                ),
                SettingMenu(
                  icon: Icons.shopping_bag,
                  title: 'My Orders',
                  subTitle: 'In-progress and Complete Order',
                  onTap: () => Get.to(() => OrderScreen()),
                ),

                // SettingMenu(icon: Icons.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account',),
                // SettingMenu(icon: Icons.discount, title: 'My Coupon', subTitle: 'List of all the discounted coupons',),

                SettingMenu(
                  icon: Icons.notifications_none,
                  title: 'Notification',
                  subTitle: 'Set any kind of notification message',
                ),

                // SettingMenu(icon: Icons.shopping_cart_outlined, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts',),

              //   App Setting
              //   SizedBox(height: 32,),
              //   sSectionHeading(title: 'App Settings',showActionButton: false,),
              //   SizedBox(height: 16,),
              //   SettingMenu(icon: Icons.drive_folder_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase',onTap: (){},),
              //   SettingMenu(
              //       icon: Icons.location_on_outlined,
              //       title: 'Geolocation',
              //       subTitle: 'Set recommendation based on location',
              //     trailing: Switch(value: true, onChanged: (value){}),
              //   ),
              //   SettingMenu(
              //     icon: Icons.security,
              //     title: 'Safe Mode',
              //     subTitle: 'Search result is safe for all ages',
              //     trailing: Switch(value: false, onChanged: (value){}),
              //   ),
              //   SettingMenu(
              //     icon: Icons.image_outlined,
              //     title: 'HD Image Quality',
              //     subTitle: 'Set image quality to be seen',
              //     trailing: Switch(value: false, onChanged: (value){}),
              //   ),

              //   logout Button
                SizedBox(height: 32,),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(onPressed: (){}, child: Text('Logout',style: TextStyle(color: Colors.red),)),
                ),
                SizedBox(height: 32 * 2.5,),

              ],
            ),)

          ],
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
        return ListTile(
          leading: Circular_image(
              image: 'Assets/Images/profile.png',
            // width: 50,
            // height: 50,
            padding: 0,
          ),
          title: Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),),
          subtitle: Text(controller.user.value.email,style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),),
          trailing: IconButton(
              onPressed: onPressed,
              icon: Icon(Icons.edit,color: Colors.white,)),
        );
  }
}
