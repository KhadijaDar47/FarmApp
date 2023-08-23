import 'package:farmapp/FarmScreen/FarmScreen.dart';
import 'package:farmapp/dashboards/enivronmentStats.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Expense/ExpenseScreen.dart';
import '../Expense/expenseDashboard.dart';
import '../MilkManagement/MilkScreen.dart';
import '../drawer/customDrawer.dart';
import 'basicHealthStats.dart';

double defaultRadius = 8.0;

class CardBasicRoute extends StatefulWidget {
  const CardBasicRoute({super.key});

  @override
  CardBasicRouteState createState() => CardBasicRouteState();
}

class CardBasicRouteState extends State<CardBasicRoute> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Admin Dashboard',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w300,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF2879E9),
      ),
      drawer: const CustomDrawer(userRole: 'Admin'),
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
                              "Total Farms",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Colors.grey.shade700,
                              ),
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
                                  child: Text(
                                    '7', //style: secondaryTextStyle(color: appStore.textSecondaryColor),
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 28,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_circle_right,
                                  color: const Color(0xFF2879E9),
                                ), //, color: appStore.iconColor
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
                            child: Text(
                              "Total Employees",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Colors.grey.shade700,
                              ),
                              /*style: primaryTextStyle(
                        color: appStore.textPrimaryColor,
                      )*/
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
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Farmers: 10', //style: secondaryTextStyle(color: appStore.textSecondaryColor),
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                  ),
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
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w300,
                                fontSize: 22,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: const Color(0xFF2879E9),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const FarmMainScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Details',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
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
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Text(
                                  '17',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Un healthy',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Text(
                                  '20',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Vaccinated',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Text(
                                  '20',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: Colors.grey.shade700,
                                  ),
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
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ExpenseScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0, backgroundColor: Colors.white),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 2, top: 10),
                                  child: Text(
                                    "Expense ",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 10),
                                  child: Text(
                                    "2500 PKR",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 128, 128, 128),
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
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.event,
                                  color: const Color(0xFF2879E9)),
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
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MilkMainScreen(),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 10),
                                  child: Text(
                                    "Milk Production ",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 10),
                                  child: Text(
                                    "1724 Ltrs",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 128, 128, 128),
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
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(
                                Icons.event,
                                color: Color(0xFF2879E9),
                              ),
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
                  child: Text(
                    'Take control of your Livestock',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ],
            ),
            // Container(height: 2),
            // const Spacer(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFF2879E9),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(),
                        ),
                      );
                    },
                    child: ListTile(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      tileColor: const Color(0xFF2879E9),
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      leading: const Icon(Icons.feed),
                      title: Text(
                        'Environment Health',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_circle_right_outlined),
                      subtitle: const Text('This is a subtitle'),
                    ),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2879E9)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    child: ListTile(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      tileColor: const Color(0xFF2879E9),
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      leading: const Icon(Icons.health_and_safety),
                      title: Text(
                        'Livestock Health',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: const Text('This is a subtitle'),
                      trailing: const Icon(Icons.arrow_circle_right_outlined),
                    ),
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
