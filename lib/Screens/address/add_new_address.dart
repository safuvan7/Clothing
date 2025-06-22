import 'package:app_project/common/widget/appbar/appBar.dart';
import 'package:flutter/material.dart';

class NewAddreesScreen extends StatelessWidget {
  const NewAddreesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Add New Address'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  labelText: 'Name',
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_android),
                    labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.location_on),
                          labelText: 'Street',
                          border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.pin),
                          labelText: 'Pin Code',
                          border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.domain),
                          labelText: 'City',
                          border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.map),
                        labelText: 'State',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.public),
                  labelText: 'Country',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: Text('Save')),
              )
            ],
          ),
        ),
      ),

    );
  }
}
