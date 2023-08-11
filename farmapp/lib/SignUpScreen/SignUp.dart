import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import '../Components/Footer.dart';
import 'SignupForm.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
            children: [
              SizedBox(height: mediaQueryData.size.height * .2),

              // add picutre for Login Page

              // Center(
              //     child: Image.asset(
              //   'assets/images/image1.png',
              //   height: 20,
              // )),

              const Text(
                "Sign up to join",
                style: TextStyle(
                    fontFamily: 'Recoleta',
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 56, 121, 233)),
              ),
              Text(
                "Create a new account to get started!",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w300,
                    fontSize: 10.0,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              SizedBox(height: mediaQueryData.size.height * 0.04),
              const SignUpForm(),
              const SignUpFooterWidget(
                textcheck: "Sign In",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
