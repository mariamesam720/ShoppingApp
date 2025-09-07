import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shooping_app/screens/welcome.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  runApp( EasyLocalization(
    supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
    path: 'lang', 
    fallbackLocale: Locale('en', 'US'),
    child:  const ShoppingApp()));
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Shop Craft',

      home: const Welcome(), // Use the Welcome screen as the home screen
    );
  }
}
