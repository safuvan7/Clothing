import 'package:app_project/Data/Controller/user_controller.dart';
import 'package:app_project/Screens/Profile/widgets/Change_Name.dart';
import 'package:app_project/Screens/store/Store_Screen.dart';
import 'package:app_project/common/widget/appbar/appBar.dart';
import 'package:app_project/common/widget/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25
          ),),
      ),
      body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Circular_image(
                            height: 80,
                            width: 80,
                            image: 'Assets/Images/profile.png'),
                        TextButton(
                            onPressed: (){},
                            child: Text('Change Profile'))
                      ],
                    ),
                  ),
                  SizedBox(height: 16 / 2,),
                  Divider(),
                  SizedBox(height: 16,),
                  sSectionHeading(
                    title: 'Profile Information',
                    showActionButton: false,
                  ),
                  SizedBox(height: 16,),
                  Profile_menu(
                    onPressed: () => Get.to(() => ChangeName()),
                    title: 'Name',
                    value: controller.user.value.fullName,
                  ),
                  Profile_menu(
                    onPressed: () {},
                    title: 'Username',
                    value: controller.user.value.username,
                  ),

                  SizedBox(height: 16 / 2,),
                  Divider(),
                  SizedBox(height: 16,),

                  sSectionHeading(
                    title: 'Personal information',
                    showActionButton: false,),
                  SizedBox(height: 16,),

                  Profile_menu(
                    icon: Icons.copy,
                    onPressed: () {},
                    title: 'User ID',
                    value: controller.user.value.id,
                  ),
                  Profile_menu(
                    onPressed: () {},
                    title: 'E-mail',
                    value: controller.user.value.email,
                  ),
                  Profile_menu(
                    onPressed: () {},
                    title: 'Phone Number',
                    value: controller.user.value.phone,
                  ),
                  Profile_menu(
                    onPressed: () {},
                    title: 'Gender',
                    value: 'Male',
                  ),
                  Profile_menu(
                    onPressed: () {},
                    title: 'Date of Birth',
                    value: '01 Jan 1990',
                  ),
                  Divider(),
                  SizedBox(height: 16,),

                  Center(
                    child: TextButton(
                        onPressed: (){},
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                              color: Colors.red
                          ),)),
                  )
                ],
              ),),
          )
    );
  }
}

class Profile_menu extends StatelessWidget {
  const Profile_menu({
    super.key,
    this.icon = Icons.keyboard_arrow_right_outlined,
    required this.onPressed,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16 / 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title ,style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(child: Icon(icon,size: 18,))
          ],
        ),
      ),
    );
  }
}
