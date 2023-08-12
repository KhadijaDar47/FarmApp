import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

// import '../Components/CustomDrawer.dart';
// import '../Components/theme_colors.dart';
// import 'package:pizzaapp/Classes/UserRole.dart';

class ExpenseDashboard extends StatefulWidget {
  const ExpenseDashboard({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ExpenseDashboardState createState() => _ExpenseDashboardState();
}

class _ExpenseDashboardState extends State<ExpenseDashboard> {
  // const SalesExpenseDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          // drawer: CustomDrawer(),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: const Text('Expenses'),
          backgroundColor: Colors.black,
        ),
        // drawer:  CustomDrawer(userRole: UserRole.role,),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: const Color(0xFF021536)),
              ),
              margin: const EdgeInsets.all(16.0),
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black,
                ),
                tabs: const [
                  Tab(text: 'Daily'),
                  Tab(text: 'Weekly'),
                  Tab(text: 'Monthly'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    margin: const EdgeInsets.all(16.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Today Sales',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '1500 PKR',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 120,
                                    child: Card(
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        side: BorderSide(color: Colors.black),
                                      ),

                                      color:
                                          Colors.white, // Add background color
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 2, 15, 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Total Orders: 57",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'Delivered',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '17',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 30),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'In-Process',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '20',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 30),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Cancelled',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '20',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 30),
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
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 120,
                                    child: Card(
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        side: BorderSide(color: Colors.black),
                                      ),
                                      color: Colors.white,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 2, 15, 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Expenditures: 57000 ",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'Expenses',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '17000 ',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 20),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Purchases',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '20000',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 20),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Sales',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '20000',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 20),
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
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 120,
                                    child: Card(
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        side: BorderSide(color: Colors.black),
                                      ),
                                      color:
                                          Colors.white, // Add background color
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2, top: 7),
                                            child: Text(
                                              "Profit ",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  color: const Color.fromARGB(
                                                      255, 31, 31, 31)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0, top: 10),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 35.0),
                                                  child: Text(
                                                    "25%",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 24,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 31, 31, 31)),
                                                  ),
                                                ),
                                                const Icon(Icons.arrow_upward)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ), // Add content or adjust the height
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 120,
                                    child: Card(
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        side: BorderSide(color: Colors.black),
                                      ),
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2, top: 7),
                                            child: Text(
                                              "Loss ",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  color: const Color.fromARGB(
                                                      255, 31, 31, 31)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 35.0, top: 8),
                                                  child: Text(
                                                    "25%",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 24,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 31, 31, 31)),
                                                  ),
                                                ),
                                                const Icon(Icons.arrow_downward)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ), // Add background color
                                      // Add content or adjust the height
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //**************************************************                WEEKLY         ***************************************************************************** */
                  Container(
                    margin: const EdgeInsets.all(16.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Weekly Sales ',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '7520 PKR',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 120,
                                    child: Card(
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        side: BorderSide(color: Colors.black),
                                      ),
                                      color: Colors.white,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 2, 15, 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Total Orders: 57",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'Delivered',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '17',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 30),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'In-Process',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '20',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 30),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Cancelled',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '20',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 30),
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
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 120,
                                    child: Card(
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        side: BorderSide(color: Colors.black),
                                      ),

                                      color:
                                          Colors.white, // Add background color
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 2, 15, 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Expenditures: 57000 ",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'Expenses',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '17000 ',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 20),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Purchases',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '20000',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 20),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Sales',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '20000',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 20),
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

                                      // Add content or adjust the height
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 120,
                                    child: Card(
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        side: BorderSide(color: Colors.black),
                                      ),
                                      color:
                                          Colors.white, // Add background color
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2, top: 7),
                                            child: Text(
                                              "Profit ",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  color: const Color.fromARGB(
                                                      255, 31, 31, 31)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0, top: 10),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 35.0),
                                                  child: Text(
                                                    "25%",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 24,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 31, 31, 31)),
                                                  ),
                                                ),
                                                const Icon(Icons.arrow_upward)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ), // Add content or adjust the height
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 120,
                                    child: Card(
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        side: BorderSide(color: Colors.black),
                                      ),
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2, top: 7),
                                            child: Text(
                                              "Loss ",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  color: const Color.fromARGB(
                                                      255, 31, 31, 31)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 35.0, top: 8),
                                                  child: Text(
                                                    "25%",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 24,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 31, 31, 31)),
                                                  ),
                                                ),
                                                const Icon(Icons.arrow_downward)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ), // Add background color
                                      // Add content or adjust the height
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //**************************   MONTHLY SALES                  ***************************** */
                  Container(
                    margin: const EdgeInsets.all(16.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Monthly Sales',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '30000 PKR',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 120,
                                    child: Card(
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        side: BorderSide(color: Colors.black),
                                      ),

                                      color:
                                          Colors.white, // Add background color
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 2, 15, 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Total Orders: 57",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'Delivered',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '17',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 30),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'In-Process',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '20',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 30),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Cancelled',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '20',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 30),
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

                                      // Add content or adjust the height
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 120,
                                    child: Card(
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        side: BorderSide(color: Colors.black),
                                      ),

                                      color:
                                          Colors.white, // Add background color
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 2, 15, 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Expenditures: 57000 ",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'Expenses',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '17000 ',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 20),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Purchases',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '20000',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 20),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Sales',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14),
                                                        ),
                                                        Text(
                                                          '20000',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 20),
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

                                      // Add content or adjust the height
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 120,
                                    child: Card(
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        side: BorderSide(color: Colors.black),
                                      ),
                                      color:
                                          Colors.white, // Add background color
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2, top: 7),
                                            child: Text(
                                              "Profit ",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  color: const Color.fromARGB(
                                                      255, 31, 31, 31)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0, top: 10),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 35.0),
                                                  child: Text(
                                                    "25%",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 24,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 31, 31, 31)),
                                                  ),
                                                ),
                                                const Icon(Icons.arrow_upward)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ), // Add content or adjust the height
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 120,
                                    child: Card(
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        side: BorderSide(color: Colors.black),
                                      ),
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2, top: 7),
                                            child: Text(
                                              "Loss ",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  color: const Color.fromARGB(
                                                      255, 31, 31, 31)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 35.0, top: 8),
                                                  child: Text(
                                                    "25%",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 24,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 31, 31, 31)),
                                                  ),
                                                ),
                                                const Icon(Icons.arrow_downward)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ), // Add background color
                                      // Add content or adjust the height
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, 'AddExpense');
            },
            backgroundColor: Colors.black,
            tooltip: 'Add',
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
      ),
    );
  }
}
