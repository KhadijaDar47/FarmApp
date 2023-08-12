// import 'package:flutter/foundation.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/services/asset_manifest.dart' as flutter_asset;
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/src/asset_manifest.dart' as google_fonts_asset;

// google_fonts_asset.AssetManifest googleFontsAssetManifest =
//     google_fonts_asset.AssetManifest();
// Usage
// flutter_asset.AssetManifest flutterAssetManifest = flutter_asset.AssetManifest();

double defaultRadius = 8.0;
// const double _cardWidth = 115;

class StatCards extends StatefulWidget {
  const StatCards({super.key});

  @override
  StatCardsState createState() => StatCardsState();
}

class StatCardsState extends State<StatCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Employee Dashboard',
            style: GoogleFonts.poppins(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 31, 31, 31),
        // leading: const Drawer(
        //   backgroundColor: Color.fromARGB(255, 31, 31, 31),

        //   // foregroundColor: Colors.white,
        // ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 2, left: 5, right: 5, bottom: 2),
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(height: 7),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Card(
                    elevation: 1,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 8),
                            child: Text(
                              "Chaudhry Dairy Farms",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(fontSize: 16),
                              /*style: primaryTextStyle(
                        color: appStore.textPrimaryColor,
                      )*/
                            ),
                          ),
                          // const Divider(),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Center(
                                  child: SizedBox(
                                    height: 27,
                                    child: Text(
                                      'Raiwind Road, Lahore', //style: secondaryTextStyle(color: appStore.textSecondaryColor),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,

                                      style: GoogleFonts.poppins(fontSize: 12),
                                    ),
                                  ),
                                ),
                                // const Icon(Icons
                                //     .arrow_circle_right),
                                //, color: appStore.iconColor
                                // const SizedBox(
                                //   height: 6,
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(width: 2),
                Expanded(
                  flex: 1,
                  child: Card(
                    elevation: 1,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 8),
                            child: SizedBox(
                              height: 27,
                              child: Text(
                                "Total Employees",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(fontSize: 16),
                                /*style: primaryTextStyle(
                                                    color: appStore.textPrimaryColor,
                                                  )*/
                              ),
                            ),
                          ),
                          // const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    'Doctor: 5', //style: secondaryTextStyle(color: appStore.textSecondaryColor),
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  ),
                                ),
                                Text(
                                  'Farmers: 10', //style: secondaryTextStyle(color: appStore.textSecondaryColor),
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),

                                // const Icon(Icons
                                //     .arrow_circle_right), //, color: appStore.iconColor
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(height: 5),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Cows: 57",
                              style: GoogleFonts.poppins(fontSize: 24),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor:
                                      const Color.fromARGB(255, 31, 31, 31),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                              onPressed: () {
                                Navigator.pushNamed(context, 'addCows');
                              },
                              child: Text(
                                'Details',
                                style: GoogleFonts.poppins(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Healthy',
                                  style: GoogleFonts.poppins(fontSize: 14),
                                ),
                                Text(
                                  '17',
                                  style: GoogleFonts.poppins(fontSize: 30),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Un healthy',
                                  style: GoogleFonts.poppins(fontSize: 14),
                                ),
                                Text(
                                  '20',
                                  style: GoogleFonts.poppins(fontSize: 30),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Vaccinated',
                                  style: GoogleFonts.poppins(fontSize: 14),
                                ),
                                Text(
                                  '20',
                                  style: GoogleFonts.poppins(fontSize: 30),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 5),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    //color: Colors.teal[800],
                    color: Colors.white,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          // padding: const EdgeInsets.only(left: 15, top: 8),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 2, top: 10),
                                child: Text(
                                  "Expense ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: const Color.fromARGB(
                                          255, 31, 31, 31)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 10),
                                child: Text(
                                  "2500 PKR",
                                  style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      color: const Color.fromARGB(
                                          255, 31, 31, 31)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 31, 31, 31),
                          thickness: 0.5,
                          height: 0,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 15,
                            ),
                            Text(
                              "March 19, 2023",
                              style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(255, 31, 31, 31)),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.event,
                                  color: Color.fromARGB(255, 31, 31, 31)),
                              onPressed: () {},
                            ),
                            Container(
                              width: 4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(width: 2),
                Expanded(
                  flex: 1,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    //color: Colors.teal[800],
                    color: Colors.white,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          // padding: const EdgeInsets.only(left: 15, top: 8),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 10),
                                child: Text(
                                  "Milk Production ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: const Color.fromARGB(
                                          255, 31, 31, 31)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 10),
                                child: Text(
                                  "1724 Ltrs",
                                  style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      color: const Color.fromARGB(
                                          255, 31, 31, 31)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 31, 31, 31),
                          thickness: 0.5,
                          height: 0,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 15,
                            ),
                            Text(
                              "March 19, 2023",
                              style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(255, 31, 31, 31)),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.event,
                                  color: Color.fromARGB(255, 31, 31, 31)),
                              onPressed: () {},
                            ),
                            Container(
                              width: 4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 37),
                  child: Text('Take control of your Livestock',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 31, 31, 31),
                          fontSize: 20)),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    tileColor: const Color.fromARGB(255, 31, 31, 31),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    leading: const Icon(Icons.feed),
                    title: Text(
                      'Feed Management',
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent),
                        onPressed: () {
                          Navigator.pushNamed(context, 'Feed');
                        },
                        child: const Icon(Icons.arrow_circle_right_outlined)),
                    subtitle: const Text('This is a subtitle'),
                  ),
                  const SizedBox(height: 2),
                  ListTile(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    tileColor: const Color.fromARGB(255, 31, 31, 31),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    leading: const Icon(Icons.health_and_safety),
                    title: Text(
                      'Health Status',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 16),
                    ),
                    subtitle: const Text('This is a subtitle'),
                    trailing: const Icon(Icons.arrow_circle_right_outlined),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
