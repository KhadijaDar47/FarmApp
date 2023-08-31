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
//                         image: AssetImage('assets/icons/heartbeat.png'),
//                         title: "Hearbeat",
//                         value: "66",
//                         unit: "bpm",
//                         color: Constants.lightGreen,
//                       ),
//                       CardMain(
//                           image: AssetImage('assets/icons/blooddrop.png'),
//                           title: "Blood Pressure",
//                           value: "66/123",
//                           unit: "mmHg",
//                           color: Constants.lightYellow)
//                     ],
//                   ),
//                 ),

//                 // Section Cards - Daily Medication
//                 SizedBox(height: 50),

//                 Text(
//                   "MEDICATIONS AND VACCINATIONS",
//                   style: TextStyle(
//                     color: Constants.textPrimary,
//                     fontSize: 13,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 SizedBox(height: 20),

//                 Container(
//                     height: 125,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: <Widget>[
//                         CardSection(
//                           image: AssetImage('assets/icons/capsule.png'),
//                           title: "Metforminv",
//                           value: "2",
//                           unit: "pills",
//                           time: "6-7AM",
//                           isDone: false,
//                         ),
//                         CardSection(
//                           image: AssetImage('assets/icons/syringe.png'),
//                           title: "Trulicity",
//                           value: "1",
//                           unit: "shot",
//                           time: "8-9AM",
//                           isDone: true,
//                         )
//                       ],
//                     )),

//                 SizedBox(height: 50),

//                 // Scheduled Activities
//                 Text(
//                   "SCHEDULED ACTIVITIES",
//                   style: TextStyle(
//                       color: Constants.textPrimary,
//                       fontSize: 13,
//                       fontWeight: FontWeight.bold),
//                 ),

//                 SizedBox(height: 20),

//                 Container(
//                   child: ListView(
//                     scrollDirection: Axis.vertical,
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     children: <Widget>[
//                       CardItems(
//                         image: Image.asset(
//                           'assets/icons/cow.png',
//                         ),
//                         title: "Walking",
//                         value: "750",
//                         unit: "steps",
//                         color: Constants.lightYellow,
//                         progress: 30,
//                       ),
//                       CardItems(
//                         image: Image.asset(
//                           'assets/icons/water.png',
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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/const.dart';
import '../widgets/card_items.dart';
import '../widgets/card_main.dart';
import '../widgets/card_section.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _catalogdata = [];
  int cowID = 0;

  Future<void> readData() async {
    final String response = await DefaultAssetBundle.of(context)
        .loadString('lib/JsonFile/HealthDummyData.json');
    print(response); // Log the JSON response
    final data = json.decode(response);
    print(data); // Log the parsed JSON data
    // final String response = await DefaultAssetBundle.of(context)
    //     .loadString('lib/JsonFile/HealthDummyData.json');
    // final data = json.decode(response);
    _catalogdata = List<Map<String, dynamic>>.from(data["cows"]);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

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
          },
        ),
      ),
      body: _catalogdata.isNotEmpty
          ? Stack(
              children: <Widget>[
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
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _catalogdata.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: <Widget>[
                                CardMain(
                                  image:
                                      AssetImage('assets/icons/heartbeat.png'),
                                  title: 'Heart Rate',
                                  value: _catalogdata[index]['heartRate']
                                      .toString(),
                                  unit: "bpm",
                                  color: Constants.lightGreen,
                                ),
                                CardMain(
                                  image:
                                      AssetImage('assets/icons/heartbeat.png'),
                                  title: 'Temperature',
                                  value: _catalogdata[index]['temperature']
                                      .toString(),
                                  unit: "bpm",
                                  color: Constants.lightGreen,
                                ),
                              ],
                            );
                          },
                        ),
                      ),

                      // Section Cards - Daily Medication
                      SizedBox(height: 50),
                      Text(
                        "MEDICATIONS AND VACCINATIONS",
                        style: TextStyle(
                          color: Constants.textPrimary,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),

                      Container(
                          height: 125,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _catalogdata.length,
                            itemBuilder: (context, index) {
                              final cow = _catalogdata[index];
                              final List<dynamic> pills = cow['pills'];
                              final List<dynamic> vaccinations =
                                  cow['vaccinations'];

                              return Column(
                                children: <Widget>[
                                  for (var pill in pills)
                                    CardItems(
                                      image: Image.asset(
                                          'assets/icons/capsule.png'),
                                      title: pill['name'],
                                      value: "${pill['count']}",
                                      unit: "pills",
                                      color: Constants.lightGreen,
                                      progress: 0,
                                    ),
                                  for (var vaccination in vaccinations)
                                    CardItems(
                                      image: Image.asset(
                                          'assets/icons/vaccine.png'),
                                      title: vaccination['name'],
                                      value: "${vaccination['count']}",
                                      unit: "doses",
                                      color: const Color(0XFF2839E9),
                                      progress: 0,
                                    ),
                                ],
                              );
                            },
                          )),

                      SizedBox(height: 50),
                      Text(
                        "SCHEDULED ACTIVITIES",
                        style: TextStyle(
                            color: Constants.textPrimary,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _catalogdata.length,
                          itemBuilder: (context, index) {
                            final cow = _catalogdata[index];
                            return Column(
                              children: <Widget>[
                                CardItems(
                                  image: Image.asset('assets/icons/cow.png'),
                                  title: "Walking",
                                  value: "${cow['walkingSteps']}",
                                  unit: "steps",
                                  color: Constants.lightYellow,
                                  progress: 30,
                                ),
                                CardItems(
                                  image: Image.asset('assets/icons/water.png'),
                                  title: "Swimming",
                                  value: "${cow['swimmingTime']}",
                                  unit: "mins",
                                  color: Constants.lightBlue,
                                  progress: 0,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          : const Center(
              child: Text('No data to show'),
            ),
    );
  }
}
