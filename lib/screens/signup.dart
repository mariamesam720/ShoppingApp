import 'package:flutter/material.dart';
import 'package:shooping_app/utilis/custom_button.dart';
import 'package:shooping_app/utilis/my_text_field.dart';

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
    final password = passwordcontroller.text;
    final confirmPassword = confirmpasswordcontroller.text;
    final email = emailcontroller.text.trim();
    final fullname = fullnamecontroller.text.trim();
    if (_formKey.currentState!.validate()) {
      final snackbar = SnackBar(
        content: const Text('Account created successfully'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  @override
  String? _validateName(String? v) {
    //check if empty
    if (v == null || v.trim().isEmpty) return 'Full name is tequired';
    final name = v.trim();
    final first = name.characters.first;
    if (!RegExp(r'[A-Z]').hasMatch(first)) {
      return 'First letter must be uppercase';
    }
    return null;
  }

  String? _validateEmail(String? v) {
    //check if empty
    if (v == null || v.trim().isEmpty) return 'Email is required';
    //chech if email contains @
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v.trim()))
      return 'Enter a valid email';
    return null;
  }

  String? _validatepass(String? v) {
    if (v == null || v.isEmpty) return 'password is required';
    if (v.length < 6) return 'password must be at least 6 characters';
    return null;
  }

  String? _validateconfirm(String? v) {
    if (v == null || v.isEmpty) return 'confirm password is required';
    if (v!=passwordcontroller.text) return 'passwords do not match';
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
      appBar: AppBar(title: Text('Sign Up')),
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
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9333EA),
                  ),
                ),
                Text('Join Shop Craft today'),
                SizedBox(height: 20),
                MyTextField(
                  controller: fullnamecontroller,
                  hintText: 'Enter your full name',
                  obscureText: false,
                  labalText: 'Full Name',
                  valid: _validateName,
                ),
                SizedBox(height: 10),
                MyTextField(
                  controller: emailcontroller,
                  hintText: 'Enter your Email ',
                  obscureText: false,
                  labalText: 'Email',
                  valid: _validateEmail,
                ),

                SizedBox(height: 10),
                MyTextField(
                  controller: passwordcontroller,
                  hintText: 'Enter your password',
                  obscureText: true,
                  labalText: 'Password',
                  valid: _validatepass,
                ),
                SizedBox(height: 10),
                MyTextField(
                  controller: confirmpasswordcontroller,
                  hintText: 'Confirm your password',
                  obscureText: true,
                  labalText: 'Confirm Password',
                  valid: _validateconfirm,
                ),
                SizedBox(height: 20),
                CustomButton(text: 'Create Account', onPressed: _Signup),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
