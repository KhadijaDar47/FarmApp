import 'package:farmapp/DoctorScreens/Dashboard/Dashboard.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Components/CustomButton.dart';
import '../Dashboard/HealthTopMenu.dart';

class HeathScreen extends StatelessWidget {
  const HeathScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black87),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Health Record",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                    color: Color.fromARGB(255, 27, 27, 27),
                  ),
                ),
                Text(
                  "Enter the identification number of the animal to proceed further",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w300,
                    fontSize: 8.0,
                    color: Colors.grey.shade500,
                    // letterSpacing: 1,
                  ),
                ),
                SizedBox(height: mediaQueryData.size.height * .02),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 249, 251),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Animal Identification Number",
                              hintStyle: GoogleFonts.inter(
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                      SizedBox(height: mediaQueryData.size.height * 0.02),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 56, 121, 233),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8), // Adjust the value as needed
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CupertinoSegmentedControlDemo(),
                              ),
                            );
                          },
                          child: Text(
                            "Next",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
