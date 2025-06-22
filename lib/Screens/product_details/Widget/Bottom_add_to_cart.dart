import 'package:app_project/Screens/Home/Home_Screen.dart';
import 'package:flutter/material.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 24 / 2),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircularIcon(
                  icon: Icons.minimize_outlined,
                backgroundColor: Colors.grey[600],
                width: 40,
                height: 40,
                color: Colors.white,
              ),
              SizedBox(width: 16,),
              Text('2',style: Theme.of(context).textTheme.titleSmall,),
              SizedBox(width: 16,),
              CircularIcon(
                icon: Icons.add,
                backgroundColor: Colors.red,
                width: 40,
                height: 40,
                color: Colors.white,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(12),
                backgroundColor: Colors.red,
                side: BorderSide(color: Colors.red)
              ),
              child: Text('Add to Cart',style: TextStyle(color: Colors.white),)),
        ],
      ),
    );
  }
}
