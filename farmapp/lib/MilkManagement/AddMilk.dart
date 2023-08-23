import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Components/CustomButton.dart';

class AddMilkScreen extends StatefulWidget {
  const AddMilkScreen({Key? key}) : super(key: key);

  @override
  State<AddMilkScreen> createState() => _AddMilkScreenState();
}

class _AddMilkScreenState extends State<AddMilkScreen> {
  double _currentSliderValue = 0;
  // ignore: non_constant_identifier_names
  final DateController = TextEditingController();
  final CowsMilkedController = TextEditingController();
  final MilkProducedController = TextEditingController();
  var selectedTime;
  void initState() {
    super.initState();
    selectedTime = "Morning";
    DateController.text = DateFormat('MM/dd/yyyy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Milk Information",
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Information about the milk",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
              SizedBox(height: mediaQueryData.size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Enter Milk Information ",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: mediaQueryData.size.height * 0.02),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 247, 249, 251),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: TextFormField(
                        controller: CowsMilkedController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "No. of Cows Milked",
                          hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.01),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 247, 249, 251),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: selectedTime, // selected value
                        onChanged: (newValue) {
                          setState(() {
                            selectedTime = newValue;
                          });
                        },
                        items: <String>['Morning', 'Evening']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Time",
                          hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.02),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 247, 249, 251),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: TextFormField(
                                controller: DateController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Date",
                                  hintStyle: GoogleFonts.inter(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () async {
                                      final DateTime? selectedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101),
                                      );

                                      if (selectedDate != null) {
                                        DateController.text =
                                            DateFormat('MM/dd/yyyy')
                                                .format(selectedDate);
                                      }
                                    },
                                    icon: Icon(Icons.calendar_today),
                                  ),
                                ),
                                onChanged: (value) {},
                              )),
                        ),
                        const SizedBox(width: 7),
                      ],
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Milk Produced: ${_currentSliderValue.toInt()}',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w300,
                            fontSize: 11.0,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Slider(
                          value: _currentSliderValue,
                          min: 0,
                          max: 5000,
                          onChanged: (double newValue) {
                            setState(() {
                              _currentSliderValue = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.03),
                    CustomButton(
                      name: "Add Milk",
                      color: const Color.fromARGB(255, 56, 121, 233),
                      onPressed: () {
                        String milkProduced = _currentSliderValue.toString();
                        String cowsMilked = CowsMilkedController.text.trim();
                        String date = DateController.text.trim();
                        String time = selectedTime.toString();

                        if (milkProduced.isEmpty ||
                            cowsMilked.isEmpty ||
                            date.isEmpty ||
                            _currentSliderValue == 0.0 ||
                            time.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Error"),
                              content: const Text("All fields are required."),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("OK"),
                                ),
                              ],
                            ),
                          );
                          return;
                        }

                        Milk newMilk = Milk(
                          CowsMilked: int.parse(cowsMilked),
                          Date: date,
                          MilkProduced: _currentSliderValue.toInt(),
                          Time: time,
                        );
                        Navigator.pop(context, newMilk);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Milk {
  final String Date;
  final String Time;
  final int CowsMilked;
  final int MilkProduced;
  // final int cows;

  Milk({
    required this.CowsMilked,
    required this.Date,
    required this.MilkProduced,
    required this.Time,
    // required this.cows,
  });
}
