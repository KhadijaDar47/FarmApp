import 'package:farmapp/Components/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../Components/Clip.dart';

class MedicalStatusPage extends StatelessWidget {
  const MedicalStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                    margin: const EdgeInsets.only(right: 15.0),
                    width: 440,
                    height: 110,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: ClipPath(
                            clipper:
                                MyCustomClipper(clipType: ClipType.semiCircle),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                color: Colors.lightBlue.withOpacity(0.1),
                              ),
                              height: 90,
                              width: 120,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Animal Information",
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.inter(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Identification Number:233',
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 10.0,
                                            letterSpacing: 0.8,
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Age: 2 Years',
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 10.0,
                                            letterSpacing: 0.8,
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Text Fields
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
                      hintText: "Condition",
                      hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 249, 251),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Weight",
                            hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 249, 251),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Height",
                            hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 249, 251),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Medicine",
                            hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 249, 251),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Dosage",
                            hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(
                  name: "Add",
                  color: Color.fromARGB(255, 56, 121, 233),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
