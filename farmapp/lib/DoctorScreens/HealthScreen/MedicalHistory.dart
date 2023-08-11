import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Components/CustomButton.dart';
import 'TestScreen.dart';

class MedicalHistoryCard {
  final String condition;
  final String date;
  final String location;

  MedicalHistoryCard({
    required this.condition,
    required this.date,
    required this.location,
  });
}

class MedicalHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> medicalHistory = [
    {
      'condition': 'Allergies',
      'date': 'June 1, 2022',
      'location': 'Medical Center',
    },
    {
      'condition': 'Broken Arm',
      'date': 'December 15, 2021',
      'location': 'Hospital',
    },
    {
      'condition': 'Appendectomy',
      'date': 'April 5, 2021',
      'location': 'Surgical Center',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final List<MedicalHistoryCard> medicalHistoryCards =
        medicalHistory.map((data) {
      return MedicalHistoryCard(
        condition: data['condition'],
        date: data['date'],
        location: data['location'],
      );
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: medicalHistoryCards.length,
        itemBuilder: (BuildContext context, int index) {
          final historyCard = medicalHistoryCards[index];
          final MediaQueryData mediaQueryData = MediaQuery.of(context);
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          historyCard.condition,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                            color: Colors.grey.shade900,
                          ),
                        ),
                        Text(
                          '${historyCard.date}',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w300,
                            fontSize: 8.0,
                            color: Colors.orange.shade800,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Location: ${historyCard.location}',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w200,
                        fontSize: 8.0,
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
