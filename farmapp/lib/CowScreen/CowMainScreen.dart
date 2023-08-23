// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';
import 'package:farmapp/CowScreen/AddCow.dart';
import 'package:flutter/material.dart';
import '../Components/Clip.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'AddFarm.dart';

class FarmMainScreen extends StatefulWidget {
  const FarmMainScreen({Key? key}) : super(key: key);

  @override
  State<FarmMainScreen> createState() => _FarmMainScreenState();
}

class _FarmMainScreenState extends State<FarmMainScreen> {
  List<Cow> cowsData = [];
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget _appBar() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10),
            child: Icon(
              Icons.short_text,
              size: 30,
              color: Colors.black,
            ),
          ),
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 13.0, top: 10),
              child: Icon(
                Icons.notifications_none,
                size: 25,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    }

    Widget _header() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 2.0),
              ),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset("assets/images/user.png"),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good morning,",
                style: GoogleFonts.inter(
                    color: Colors.black87.withOpacity(0.8),
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Farm Owner",
                style: GoogleFonts.inter(
                    color: Colors.black87.withOpacity(0.8),
                    fontSize: 10,
                    fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ],
      );
    }

    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: cowsData
                      .map((cow) => CardSection(
                            CowID: cow.CowID,
                            Age: cow.Age,
                            Breed: cow.Breed,
                            Color: cow.Color,
                            DOB: cow.DOB,
                            Description: cow.Description,
                            Gender: cow.Gender,
                            Height: cow.Height,
                            Inherent_Quality: cow.Inherent_Quality,
                            SubBreed: cow.SubBreed,
                            Weight: cow.Weight,
                            Cost: cow.Cost ?? '0',
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newCow = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddCowScreen()),
          );

          if (newCow != null && newCow is Cow) {
            setState(() {
              cowsData.add(newCow);
            });
          }
        },
        backgroundColor: Color.fromARGB(255, 56, 121, 233),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CardSection extends StatelessWidget {
  final String CowID;
  final String Breed;
  final String SubBreed;
  final String Age;
  final String DOB;
  final String Gender;
  final String Color;
  final String Height;
  final String Weight;
  final String Inherent_Quality;
  final String Description;
  final String? Cost;
  // bool? isDone;

  CardSection({
    required this.CowID,
    required this.Breed,
    required this.SubBreed,
    required this.Age,
    required this.DOB,
    required this.Gender,
    required this.Color,
    required this.Height,
    required this.Weight,
    required this.Inherent_Quality,
    required this.Description,
    this.Cost,
  }) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: const EdgeInsets.only(right: 15.0),
          width: 440,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            shape: BoxShape.rectangle,
            color: Colors.white,
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                child: ClipPath(
                  clipper: MyCustomClipper(clipType: ClipType.semiCircle),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.lightBlue.withOpacity(0.1),
                    ),
                    height: 90,
                    width: 120,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                CowID,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 5),
                              // Text('$value $unit',
                              //     style: GoogleFonts.inter(
                              //       fontWeight: FontWeight.w300,
                              //       fontSize: 12.0,
                              //       letterSpacing: 0.8,
                              //       color: const Color.fromARGB(255, 0, 0, 0),
                              //     ),),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        // InkWell(
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       borderRadius:
                        //           const BorderRadius.all(Radius.circular(10.0)),
                        //       shape: BoxShape.rectangle,
                        //       color: isDone
                        //           ? Theme.of(context).colorScheme.secondary
                        //           : const Color(0xFFF0F4F8),
                        //     ),
                        //     width: 44,
                        //     height: 44,
                        //     child: Center(
                        //       child: Icon(
                        //         Icons.arrow_forward_ios,
                        //         color: isDone
                        //             ? Theme.of(context).colorScheme.secondary
                        //             : const Color(0xFFF0F4F8),
                        //       ),
                        //     ),
                        //   ),
                        //   onTap: () {
                        //     debugPrint(
                        //         "Button clicked. Handle button setState");
                        //   },
                        // )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
