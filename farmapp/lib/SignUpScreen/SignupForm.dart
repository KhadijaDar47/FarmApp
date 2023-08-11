// ignore_for_file: unnecessary_null_comparison

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import '../Components/Checkbox.dart';
import '../Components/CustomButton.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 247, 249, 251),
              borderRadius: BorderRadius.circular(14),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Name",
                hintStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: mediaQueryData.size.height * 0.01),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 247, 249, 251),
              borderRadius: BorderRadius.circular(14),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Email",
                hintStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: mediaQueryData.size.height * 0.01),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 247, 249, 251),
              borderRadius: BorderRadius.circular(14),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Phone",
                hintStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: mediaQueryData.size.height * 0.01),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 247, 249, 251),
              borderRadius: BorderRadius.circular(14),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Password",
                hintStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: mediaQueryData.size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SquareCheckbox(),
              const SizedBox(width: 7),
              Text(
                "Agree on Terms and Condition",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w300,
                    fontSize: 10.0,
                    color: Colors.grey.shade600),
              ),
            ],
          ),
          SizedBox(height: mediaQueryData.size.height * 0.03),
          CustomButton(
            name: "Sign Up",
            color: Color.fromARGB(255, 56, 121, 233),
            onPressed: () {},
          ),
          SizedBox(height: mediaQueryData.size.height * 0.027),
        ],
      ),
    );
  }
}
