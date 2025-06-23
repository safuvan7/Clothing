import 'package:app_project/Data/Controller/update_name_controller.dart';
import 'package:app_project/common/widget/validation/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Name',style: Theme.of(context).textTheme.headlineSmall,),
        leading: BackButton(),
      ),
      body: Padding(
          padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Use real name for easy verification. This name will appear on several pages.',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(height: 32,),

          Form(
            key: controller.updateNameFormKey,
              child: Column(
               children: [
                 TextFormField(
                   controller: controller.firstName,
                   validator: (value) => TValidator.validateEmptyText('First name', value),
                   expands: false,
                   decoration: InputDecoration(
                     labelText: 'First Name',
                     prefixIcon: Icon(Icons.person_outline),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10)
                     )
                   ),
                 ),
                 SizedBox(height: 15,),
                 TextFormField(
                   controller:controller.lastName ,
                   validator: (value) => TValidator.validateEmptyText('last name', value),
                   expands: false,
                   decoration: InputDecoration(
                     labelText: 'Last Name',
                     prefixIcon: Icon(Icons.person_outline),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10)
                     ),
                   ),
                 ),
               ],
              )),
          SizedBox(height: 32,),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: Text('Save')),
          )
        ],
      ),),

    );
  }
}
