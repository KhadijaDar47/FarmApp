import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Components/Checkbox.dart';
import '../../Components/CustomButton.dart';
import '../Dashboard/Dashboard.dart';

class VaccineHistoryCard {
  final String vaccineName;
  final DateTime date;
  final String? location;

  VaccineHistoryCard({
    required this.vaccineName,
    required this.date,
    this.location,
  });
}

class VaccineHistoryScreen extends StatefulWidget {
  const VaccineHistoryScreen({Key? key}) : super(key: key);

  @override
  State<VaccineHistoryScreen> createState() => _VaccineHistoryScreenState();
}

class _VaccineHistoryScreenState extends State<VaccineHistoryScreen> {
  final List<VaccineHistoryCard> vaccineHistoryCards = [];

  void _addVaccineHistory(VaccineHistoryCard historyCard) {
    setState(() {
      vaccineHistoryCards.add(historyCard);
    });
  }

  DateTime? newDate;
  Future<void> _showDatePicker() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        newDate = selectedDate; // Update the selected date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Vaccination Records",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: const Color.fromARGB(255, 27, 27, 27),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          String newVaccineName = '';
                          DateTime newDate = DateTime.now();
                          String newLocation = '';

                          return AlertDialog(
                            title: const Text('New Vaccine'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  onChanged: (value) {
                                    newVaccineName = value;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Vaccine name is required';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      labelText: 'Vaccine Name'),
                                ),
                                const SizedBox(height: 15),
                                GestureDetector(
                                  onTap: () => _showDatePicker(),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.calendar_today),
                                      const SizedBox(width: 10),
                                      Text(
                                        '${newDate.day}/${newDate.month}/${newDate.year}',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.0,
                                          color: Colors.grey.shade900,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  onChanged: (value) {
                                    newLocation = value;
                                  },
                                  decoration: const InputDecoration(
                                      labelText: 'Location'),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  if (newVaccineName.isNotEmpty &&
                                      newDate != null) {
                                    final newHistoryCard = VaccineHistoryCard(
                                      vaccineName: newVaccineName,
                                      date: newDate,
                                      location: newLocation.isNotEmpty
                                          ? newLocation
                                          : null,
                                    );
                                    _addVaccineHistory(newHistoryCard);
                                  }
                                  Navigator.pop(context);
                                },
                                child: const Text('Add'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 56, 121, 233),
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: vaccineHistoryCards.length,
                itemBuilder: (BuildContext context, int index) {
                  final historyCard = vaccineHistoryCards[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                historyCard.vaccineName,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0,
                                  color: Colors.grey.shade900,
                                ),
                              ),
                              Text(
                                '${historyCard.date.day}/${historyCard.date.month}/${historyCard.date.year}',
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
                            historyCard.location == null
                                ? "Unknown"
                                : 'Location: ${historyCard.location}',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w200,
                              fontSize: 9.0,
                              color: Colors.grey.shade900,
                            ),
                          ),
                          SizedBox(height: mediaQueryData.size.height * 0.02),
                          Row(
                            children: [
                              SquareCheckbox(),
                              const SizedBox(width: 5),
                              Text(
                                'Vaccinated',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 10.0,
                                  color: Colors.grey.shade900,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
