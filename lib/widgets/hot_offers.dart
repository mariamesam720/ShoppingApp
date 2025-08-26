import 'package:flutter/material.dart';

class HotOffers extends StatelessWidget {
  final List<Map<String, String>> offers = [
    {
      'image': 'assets/images/premium_laptop.jpg',
      'desc': '50% off on Electronics',
    },
  
    {
      'image': 'assets/images/premium_laptop.jpg',
      'desc': 'Buy 2 Get 1 Free',
    },
    {
      'image': 'assets/images/shopping.jpg',
      'desc': 'Student Discount',
    },
    {
      'image': 'assets/images/prof_workspace.jpg',
      'desc': 'Bundle Deals',
    },
    {
      'image': 'assets/images/shopping.jpg',
      'desc': 'Free Shipping Weekend',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Hot offers',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        ListView.builder(
          shrinkWrap: true,
          itemCount: offers.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        offers[index]["image"]!,
                        width: 100,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          offers[index]["desc"]!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
