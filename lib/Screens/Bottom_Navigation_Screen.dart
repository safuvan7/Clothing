import 'package:app_project/Screens/Settings/settings.dart';
import 'package:app_project/Screens/WishList/Favourite_Screen.dart';
import 'package:app_project/Screens/Home/Home_Screen.dart';
import 'package:app_project/Screens/store/Store_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  
  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = isDarkMode(context);
    
    return Scaffold(
      bottomNavigationBar: Obx(
          () => NavigationBar(
          height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,
            backgroundColor: darkMode ? Colors.black : Colors.white,
            indicatorColor: darkMode ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home'
              ),
              NavigationDestination(
                  icon: Icon(Icons.storefront),
                  label: 'Store'
              ),
              NavigationDestination(
                  icon: Icon(Icons.favorite_border_outlined),
                  label: 'Wishlist'
              ),
              NavigationDestination(
                  icon: Icon(Icons.person_outline_outlined),
                  label: 'Profile'
              ),
            ]
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}


class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
   HomeScreen(),
    StoreScreen(),
    FavouriteScreen(),
    SettingsScreen(),
  ];
}