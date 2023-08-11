import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomMessagePopup extends StatelessWidget {
  const CustomMessagePopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          height: 90,
          decoration: BoxDecoration(
              color: Colors.red.shade500,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              SizedBox(width: mediaQueryData.size.width * 0.15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      "Error",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0,
                          color: Colors.white),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Enter Email and Password to login",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w200,
                          fontSize: 10.0,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 35,
          child: ClipRRect(
            borderRadius:
                const BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: SvgPicture.asset(
              "assets/icons/bubbles.svg",
              height: 55,
              width: 40,
              color: Colors.red.shade700,
            ),
          ),
        ),
        Positioned(
          top: -15,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/fail.svg",
                height: 32,
                //  width: 40,
                color: Colors.red.shade500,
              ),
              Positioned(
                top: 10,
                child: SvgPicture.asset(
                  "assets/icons/close2.svg",
                  height: 13,
                  //  width: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
