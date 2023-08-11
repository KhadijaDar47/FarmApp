// ignore_for_file: unnecessary_null_comparison

import 'package:farmapp/DoctorScreens/Dashboard/Dashboard.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Components/Checkbox.dart';
import '../Components/CustomButton.dart';
import '../Components/CustomPopup.dart';
import '../Expense/ExpenseScreen.dart';
import '../FarmScreen/FarmScreen.dart';

import '../MilkScreen/MilkScreen.dart';
import '../Stock/DashboardStocks.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
              controller: emailController,
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
          SizedBox(height: mediaQueryData.size.height * 0.014),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 247, 249, 251),
              borderRadius: BorderRadius.circular(14),
            ),
            child: TextFormField(
              controller: passwordController,
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
          SizedBox(height: mediaQueryData.size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SquareCheckbox(),
              const SizedBox(width: 7),
              Text(
                "Remember Me",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                    color: Colors.grey.shade700),
              ),
            ],
          ),
          SizedBox(height: mediaQueryData.size.height * 0.04),
          CustomButton(
            name: "Login",
            color: Color.fromARGB(255, 56, 121, 233),
            onPressed: () {
              if (passwordController.text.isEmpty ||
                  emailController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: SizedBox(
                      height: mediaQueryData.size.height * 0.91,
                      child: const CustomMessagePopup(),
                    ),
                    behavior: SnackBarBehavior.fixed,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      if (emailController.text == "farm") {
                        return const FarmMainScreen();
                      } else if (emailController.text == "doctor") {
                        return DoctorDashBoardScreen();
                      } else if (emailController.text == "stock") {
                        return StockDashBoard();
                      } else if (emailController.text == "milk") {
                        return MilkMainScreen();
                      } else {
                        // Default fallback in case the category doesn't match any specific screen
                        return Container();
                      }
                    },
                  ),
                );
              }
            },
          ),
          SizedBox(height: mediaQueryData.size.height * 0.027),
        ],
      ),
    );
  }
}
