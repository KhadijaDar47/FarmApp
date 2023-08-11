import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import '../SignUpScreen/SignUp.dart';
import '../LoginScreen/Login.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    required this.textcheck,
    Key? key,
  }) : super(key: key);

  final textcheck;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Divider(
              color: Colors.grey.shade400,
            )),
            Expanded(
              child: Text(
                "Or contiune with",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    fontSize: 9.5,
                    color: Colors.grey.shade700),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
                child: Divider(
              color: Colors.grey.shade400,
            )),
          ],
        ),
        SizedBox(height: mediaQueryData.size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              //  width: double.infinity,
              height: 50,
              width: mediaQueryData.size.width * 0.395,
              child: OutlinedButton.icon(
                onPressed: () async {},
                icon: const Image(
                  image: AssetImage("assets/images/Googlelogo.png"),
                  width: 20.0,
                  height: 22,
                ),
                label: const Text("Google"),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.grey.shade400,
                  ), // Change the color to your desired outline color
                ),
              ),
            ),
            SizedBox(
              //  width: double.infinity,
              height: 50,
              width: mediaQueryData.size.width * 0.395,
              child: OutlinedButton.icon(
                onPressed: () async {},
                icon: const Image(
                  image: AssetImage("assets/images/Facebooklogo.png"),
                  width: 30.0,
                  height: 30,
                ),
                label: const Text("Facebook"),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.grey.shade400,
                  ), // Change the color to your desired outline color
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: mediaQueryData.size.height * 0.02),
        TextButton(
          onPressed: () async {
            final addroute = MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            );
            final addroute2 = MaterialPageRoute(
              builder: (context) => const SignupScreen(),
            );
            textcheck == 'Sign up'
                ? (await Navigator.push(context, addroute2))
                : (await Navigator.push(context, addroute));
          },
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: "Do you already have an account? ",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  fontSize: 10.0,
                  color: Colors.grey.shade900),
            ),
            TextSpan(
              text: textcheck.toUpperCase(),
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Color.fromARGB(255, 56, 121, 233),
                fontSize: 11.0,
              ),
            ),
          ])),
        ),
      ],
    );
  }
}
