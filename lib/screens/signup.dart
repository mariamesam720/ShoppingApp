import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shooping_app/screens/home.dart';
import 'package:shooping_app/widgets/custom_button.dart';
import 'package:shooping_app/widgets/my_text_field.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final fullnamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  void _Signup() {
    
    if (_formKey.currentState!.validate()) {
      final snackbar = SnackBar(
        backgroundColor: Colors.green,
        content: Row(
          children: [
            Expanded(
              child: Text('Account created successfully'.tr(), style: TextStyle(
                fontFamily: 'Suwannaphum',
                fontStyle: FontStyle.normal
                ),),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, 
    PageRouteBuilder(
      opaque: false,
    pageBuilder: (context,Animation,secondaryAnimation)=>  Home(),
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder:(context, animation, secondaryAnimation, child) {
       return FadeTransition(
        opacity:animation,
        child: child,
      );
    },
    ));
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: Text('Close', style: TextStyle(
                color: Colors.white,
                fontFamily: 'Suwannaphum',
                fontStyle: FontStyle.normal
                ),),
            ),
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    
  }

  @override
  void initState() {
    super.initState();
    passwordcontroller.addListener(() {
      if(_formKey.currentState!=null){
        _formKey.currentState!.validate();
      }
    });
    
  }
  String? _validateName(String? v) {
    //check if empty
    if (v == null || v.trim().isEmpty) return 'Full name is required'.tr();
    final name = v.trim();
    final first = name.characters.first;
    if (!RegExp(r'[A-Z]').hasMatch(first)) {
      return 'First letter must be uppercase'.tr();
    }
    return null;
  }

  String? _validateEmail(String? v) {
    //check if empty
    if (v == null || v.trim().isEmpty) return 'Email is required'.tr();
    //chech if email contains @
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v.trim()))
      return 'Enter a valid email'.tr();
    return null;
  }

  String? _validatepass(String? v) {
    if (v == null || v.isEmpty) return 'password is required'.tr();
    if (v.length < 6) return 'password must be at least 6 characters'.tr();
    return null;
  }

  String? _validateconfirm(String? v) {
    if (v == null || v.isEmpty) return 'confirm password is required'.tr();
    if (v.trim()!=passwordcontroller.text.trim()) return 'passwords do not match'.tr();
    return null;
  }

  void dispose() {
    fullnamecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmpasswordcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up'.tr(), style: TextStyle(fontFamily: 'Suwannaphum', fontStyle: FontStyle.normal),),
      
      
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Create an Account'.tr(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9333EA),
                    fontFamily: 'Suwannaphum',
                    fontStyle: FontStyle.normal
                  ),
                ),
                Text('Join Shop Craft today'.tr(), style: TextStyle(fontFamily: 'Suwannaphum', fontStyle: FontStyle.normal),),
                SizedBox(height: 20),
                MyTextField(
                  controller: fullnamecontroller,
                  hintText: 'Enter your full name'.tr(),
                  obscureText: false,
                  labalText: 'Full Name'.tr(),
                  valid: _validateName, onChanged: (v) {  },
                ),
                SizedBox(height: 10),
                MyTextField(
                  controller: emailcontroller,
                  hintText: 'Enter your Email '.tr(),
                  obscureText: false,
                  labalText: 'Email'.tr(),
                  valid: _validateEmail, onChanged: (v) {  },
                ),

                SizedBox(height: 10),
                MyTextField(
                  controller: passwordcontroller,
                  hintText: 'Enter your password'.tr(),
                  obscureText: true,
                  labalText: 'Password'.tr(),
                  valid: _validatepass, onChanged: (v) {  },
                ),
                SizedBox(height: 10),
                MyTextField(
                  controller: confirmpasswordcontroller,
                  hintText: 'Confirm your password'.tr(),
                  obscureText: true,
                  labalText: 'Confirm Password'.tr(),
                  valid: _validateconfirm,
                  onChanged: (v) {
                    if (_formKey.currentState != null) {
                      _formKey.currentState!.validate();
                    }
                  },
                ),
                SizedBox(height: 20),
                CustomButton(text: 'Create Account'.tr(), onPressed: _Signup),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
