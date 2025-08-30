import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shooping_app/screens/home.dart';
import 'package:shooping_app/widgets/custom_button.dart';
import 'package:shooping_app/widgets/my_text_field.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  void signUserIn() {
    if (_formKey.currentState!.validate()) {
      final snackBar = SnackBar(content: Text('Account sign-in successfully'.tr()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
    } else {
      final snackBar = SnackBar(content: Text('Invalid email or password'.tr()));
    }
  }

  String? _validateEmail(String? v) {
    if (v == null || v.trim().isEmpty) return 'Email is required'.tr();
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v.trim())) {
      return 'Enter a valid email'.tr();
    }
    return null;
  }

  String? _validatepass(String? v) {
    if (v == null || v.trim().isEmpty) return 'password is required'.tr();
    if (v.trim().length < 6) return 'password must be at least 6 characters'.tr();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'.tr())),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome Back'.tr(),
              style: TextStyle(
                color: Color(0xFF9333EA),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Sign in to ShopCraft".tr()),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MyTextField(
                controller: emailcontroller,
                hintText: 'Email'.tr(),
                obscureText: false,
                labalText: 'Email'.tr(),
                valid: _validateEmail, onChanged: (v) {  },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyTextField(
                controller: passwordcontroller,
                hintText: 'Password'.tr(),
                obscureText: true,
                labalText: 'Password'.tr(),
                valid: _validatepass, onChanged: (v) {  },
              ),
            ),
            SizedBox(height: 20),
            CustomButton(text: 'Sign in'.tr(), onPressed: signUserIn),
          ],
        ),
      ),
    );
  }
}
