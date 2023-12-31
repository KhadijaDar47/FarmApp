// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../FarmScreen/FarmScreen.dart';
// import '../utils/const.dart';
// import '../widgets/card_items.dart';
// import '../widgets/card_main.dart';
// // import 'package:mediapp/utils/const.dart';
// // import 'package:mediapp/widgets/card_items.dart';
// // import 'package:mediapp/widgets/card_main.dart';
// // import 'package:mediapp/widgets/card_section.dart';
// // import 'package:mediapp/widgets/custom_clipper.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double statusBarHeight = MediaQuery.of(context).padding.top;

//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       appBar: AppBar(
//         title: Text(
//           'Health Statistics',
//           style: GoogleFonts.poppins(fontSize: 18, color: Colors.black),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//       ),
//       body: Stack(
//         children: <Widget>[
//           // ClipPath(
//           //   clipper: MyCustomClipper(clipType: ClipType.bottom),
//           //   child: Container(
//           //     color: Theme.of(context).colorScheme.secondary,
//           //     height: Constants.headerHeight + statusBarHeight,
//           //   ),
//           // ),
//           // Positioned(
//           //   right: -45,
//           //   top: -30,
//           //   child: ClipOval(
//           //     child: Container(
//           //       color: Colors.black.withOpacity(0.05),
//           //       height: 220,
//           //       width: 220,
//           //     ),
//           //   ),
//           // ),

//           // BODY
//           Padding(
//             padding: EdgeInsets.all(Constants.paddingSide),
//             child: ListView(
//               children: <Widget>[
//                 // Header - Greetings and Avatar
//                 Row(
//                   children: <Widget>[
//                     // GestureDetector(
//                     //     onTap: () {
//                     //       Navigator.pop('buttons');
//                     //     },
//                     //     child: const Icon(
//                     //       Icons.arrow_back_ios_new_rounded,
//                     //       color: Colors.black,
//                     //     )),
//                     Expanded(
//                       child: Text("Good Morning,\nAdmin",
//                           style: GoogleFonts.poppins(
//                               fontSize: 24, color: Colors.black)),
//                     ),
//                     // CircleAvatar(
//                     //     radius: 26.0,
//                     //     backgroundImage:
//                     //         AssetImage('assets/icons/profile_picture.png'))
//                   ],
//                 ),

//                 const SizedBox(height: 30),

//                 // Main Cards - Heartbeat and Blood Pressure
//                 Container(
//                   height: 140,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: <Widget>[
//                       CardMain(
//                         image: const AssetImage('assets/dashboardIcons/heartbeat.png'),
//                         title: "Hearbeat",
//                         value: "66",
//                         unit: "bpm",
//                         color: Constants.lightGreen,
//                       ),
//                       CardMain(
//                           image: const AssetImage('assets/dashboardIcons/blooddrop.png'),
//                           title: "Blood Pressure",
//                           value: "66/123",
//                           unit: "mmHg",
//                           color: Constants.lightYellow)
//                     ],
//                   ),
//                 ),

//                 // Section Cards - Daily Medication
//                 const SizedBox(height: 50),

//                 Text(
//                   "MEDICATIONS AND VACCINATIONS",
//                   style: TextStyle(
//                     color: Constants.textPrimary,
//                     fontSize: 13,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 Container(
//                     height: 125,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: <Widget>[
//                         CardSection(
//                           image: const AssetImage('assets/dashboardIcons/capsule.png'),
//                           title: "Metforminv",
//                           value: "2",
//                           unit: "pills",
//                           time: "6-7AM",
//                           isDone: false,
//                         ),
//                         CardSection(
//                           image: const AssetImage('assets/dashboardIcons/syringe.png'),
//                           title: "Trulicity",
//                           value: "1",
//                           unit: "shot",
//                           time: "8-9AM",
//                           isDone: true,
//                         )
//                       ],
//                     )),

//                 const SizedBox(height: 50),

//                 // Scheduled Activities
//                 Text(
//                   "SCHEDULED ACTIVITIES",
//                   style: TextStyle(
//                       color: Constants.textPrimary,
//                       fontSize: 13,
//                       fontWeight: FontWeight.bold),
//                 ),

//                 const SizedBox(height: 20),

//                 Container(
//                   child: ListView(
//                     scrollDirection: Axis.vertical,
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     children: <Widget>[
//                       CardItems(
//                         image: Image.asset(
//                           'assets/dashboardIcons/cow.png',
//                         ),
//                         title: "Walking",
//                         value: "750",
//                         unit: "steps",
//                         color: Constants.lightYellow,
//                         progress: 30,
//                       ),
//                       CardItems(
//                         image: Image.asset(
//                           'assets/dashboardIcons/water.png',
//                         ),
//                         title: "Swimming",
//                         value: "30",
//                         unit: "mins",
//                         color: Constants.lightBlue,
//                         progress: 0,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../FarmScreen/FarmScreen.dart';
import '../utils/const.dart';
import '../widgets/card_items.dart';
import '../widgets/card_main.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          'Health Statistics',
          style: GoogleFonts.poppins(fontSize: 18, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Stack(
        children: <Widget>[
          // BODY
          Padding(
            padding: EdgeInsets.all(Constants.paddingSide),
            child: ListView(
              children: <Widget>[
                // Header - Greetings and Avatar
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Good Morning,\nAdmin",
                          style: GoogleFonts.poppins(
                              fontSize: 24, color: Colors.black)),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Main Cards - Heartbeat and Blood Pressure
                Container(
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CardMain(
                        image: const AssetImage(
                            'assets/dashboardIcons/heartbeat.png'),
                        title: "Hearbeat",
                        value: "66",
                        unit: "bpm",
                        color: Constants.lightGreen,
                      ),
                      CardMain(
                          image: const AssetImage(
                              'assets/dashboardIcons/blooddrop.png'),
                          title: "Blood Pressure",
                          value: "66/123",
                          unit: "mmHg",
                          color: Constants.lightYellow)
                    ],
                  ),
                ),

                // Section Cards - Daily Medication
                const SizedBox(height: 50),

                Text(
                  "MEDICATIONS AND VACCINATIONS",
                  style: TextStyle(
                    color: Constants.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                    height: 125,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        CardSection(
                          image: const AssetImage(
                              'assets/dashboardIcons/capsule.png'),
                          title: "Metforminv",
                          value: "2",
                          unit: "pills",
                          time: "6-7AM",
                          isDone: false,
                        ),
                        CardSection(
                          image: const AssetImage(
                              'assets/dashboardIcons/syringe.png'),
                          title: "Trulicity",
                          value: "1",
                          unit: "shot",
                          time: "8-9AM",
                          isDone: true,
                        )
                      ],
                    )),

                const SizedBox(height: 50),

                // Scheduled Activities
                Text(
                  "SCHEDULED ACTIVITIES",
                  style: TextStyle(
                      color: Constants.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      CardItems(
                        image: Image.asset(
                          'assets/dashboardIcons/cow.png',
                        ),
                        title: "Walking",
                        value: "750",
                        unit: "steps",
                        color: Constants.lightYellow,
                        progress: 30,
                      ),
                      CardItems(
                        image: Image.asset(
                          'assets/dashboardIcons/water.png',
                        ),
                        title: "Swimming",
                        value: "30",
                        unit: "mins",
                        color: Constants.lightBlue,
                        progress: 0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
