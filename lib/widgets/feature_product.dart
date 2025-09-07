import 'package:flutter/material.dart';

class FeatureProduct extends StatelessWidget {
  final String imagePath;
  final String data ;
  const FeatureProduct({super.key, required this.imagePath, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.fill)
      ),
      child: Padding(
      padding: EdgeInsetsGeometry.only(left: 70, top: 150),
        child: Text(data, style: TextStyle(
          fontSize: 20,fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Suwannaphum',
          fontStyle: FontStyle.normal
          ),),),
    );
  }
}
