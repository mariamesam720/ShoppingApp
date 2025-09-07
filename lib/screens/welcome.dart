import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shooping_app/screens/signup.dart';
import 'package:shooping_app/screens/Login.dart';
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Craft', style: TextStyle(fontFamily: 'Suwannaphum'),),
        actions: [
          IconButton(
            onPressed: () {
              if (context.locale.languageCode == 'en') {
                context.setLocale(const Locale('ar', 'EG'));
              } else {
                context.setLocale(const Locale('en', 'US'));
              }
            },
            icon: Icon(Icons.language_outlined, size: 30),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Your Premium Shopping Experience'.tr(), style: TextStyle(fontSize: 15, fontFamily: 'Suwannaphum'),)),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/shopping.jpg', width: 150, height: 150, fit: BoxFit.cover),
                SizedBox(width: 15,),
                Image.network('https://images.unsplash.com/photo-1649972904349-6e44c42644a7?w=300&h=200&fit=crop', width: 150, height: 150, fit: BoxFit.cover),
              ],
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                }, child:Text("Login".tr(), style: TextStyle(fontFamily:'Suwannaphum '),),),
            
                SizedBox(width: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                }, child:Text("Sign Up".tr(), style: TextStyle(fontFamily:'Suwannaphum '),),),
              ],
            )
          ],
        ),
      ),
    );
  }
}