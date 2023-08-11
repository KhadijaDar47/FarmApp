import "package:flutter/material.dart";
import '../Components/Footer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              left: mediaQueryData.size.width / 11,
              right: mediaQueryData.size.width / 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // add picutre for Login Page

              // Center(
              //     child: Image.asset(
              //   'assets/images/image1.png',
              //   height: 20,
              // )),
              SizedBox(height: mediaQueryData.size.height * 0.23),

              const Text(
                "Sign In to join",
                style: TextStyle(
                    fontFamily: 'Recoleta',
                    fontSize: 29,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 56, 121, 233)),
              ),

              Text(
                "Welcome Back! Please enter your details",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  fontSize: 10.0,
                  letterSpacing: 0.8,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: mediaQueryData.size.height * 0.04),
              const LoginForm(),
              const SignUpFooterWidget(
                textcheck: "Sign up",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
