import 'package:app_project/Screens/address/add_new_address.dart';
import 'package:app_project/Screens/address/widget/approve_address.dart';
import 'package:app_project/common/widget/appbar/appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () => Get.to(() => NewAddreesScreen()),
      child: Icon(Icons.add,color: Colors.white,),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(24),
        child: Column(
          children: [
            ApproveAddress(selectedAddress: false),
            ApproveAddress(selectedAddress: true),
          ],
        ),),
      ),

    );
  }
}
