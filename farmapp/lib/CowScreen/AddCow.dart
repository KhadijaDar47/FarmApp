import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Components/CustomButton.dart';
// Import the CustomButton and Farm classes if they are implemented in your project

class AddCowScreen extends StatefulWidget {
  const AddCowScreen({Key? key}) : super(key: key);

  @override
  State<AddCowScreen> createState() => _AddCowScreenState();
}

class _AddCowScreenState extends State<AddCowScreen> {
  // double _currentSliderValue = 0;
  int cowid = 0;
  DateTime selectedDate = DateTime.now();
  final idController = TextEditingController();
  final ageController = TextEditingController();
  final breedController = TextEditingController();
  final subBreedController = TextEditingController();
  final WeightController = TextEditingController();
  final HeightContoller = TextEditingController();
  final ColourController = TextEditingController();
  final CostController = TextEditingController();
  final iqController = TextEditingController();
  final genderController = TextEditingController();
  final DescriptionController = TextEditingController();
  final DOBController = TextEditingController();

  List<String> inherentQualityOptions = [
    'Own',
    'Purchased',
  ];
  String selectedInherentQuality = 'Own';

  List<String> genderOptions = ['Male', 'Female'];
  String selectedGender = 'Male';

  void incrementCowID() {
    setState(() {
      cowid++;
      idController.text = cowid.toString();
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        DOBController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
        // Calculate age and update age text field
        DateTime currentDate = DateTime.now();
        int age = currentDate.year - selectedDate.year;
        ageController.text = age.toString();
      });
    }
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
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Farm Information",
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Information about the farm",
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
                    "Enter Farm Information ",
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
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: idController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Cow ID",
                                hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                          Container(width: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: ElevatedButton(
                              onPressed: incrementCowID,
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0XFF2879E9),
                                elevation: 0,
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 8, bottom: 8, right: 12, left: 12),
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ),
                        ],
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
                      child: TextFormField(
                        controller: breedController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Breed",
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
                      child: TextFormField(
                        controller: subBreedController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Sub-Breed",
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
                        value: selectedGender,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Sub-Breed",
                          hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                        items: genderOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),

                    SizedBox(height: mediaQueryData.size.height * 0.01),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selectDate(context),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 247, 249, 251),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: TextFormField(
                                controller: DOBController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Date of Birth",
                                  hintStyle: GoogleFonts.inter(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 249, 251),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: TextFormField(
                              controller: ageController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Age",
                                hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Enter Basic Information ",
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
                    SizedBox(height: mediaQueryData.size.height * 0.01),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 247, 249, 251),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: TextFormField(
                        controller: ColourController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Color",
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
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 249, 251),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: TextFormField(
                              controller: HeightContoller,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Height",
                                hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 249, 251),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: TextFormField(
                              controller: WeightController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "weight",
                                hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                      ],
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
                        value: selectedInherentQuality,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Inherent Quality",
                          hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedInherentQuality = value!;
                          });
                        },
                        items: inherentQualityOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.01),
                    Visibility(
                      visible: selectedInherentQuality == 'Purchased',
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 249, 251),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextFormField(
                          controller: CostController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Cost",
                            hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          onChanged: (value) {},
                        ),
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
                      child: TextFormField(
                        controller: DescriptionController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Description",
                          hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.02),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Container(
                    //         padding: const EdgeInsets.symmetric(horizontal: 25),
                    //         height: 50,
                    //         decoration: BoxDecoration(
                    //           color: const Color.fromARGB(255, 247, 249, 251),
                    //           borderRadius: BorderRadius.circular(14),
                    //         ),
                    //         child: TextFormField(
                    //           controller: HeightContoller,
                    //           keyboardType: TextInputType.number,
                    //           inputFormatters: [
                    //             FilteringTextInputFormatter.digitsOnly
                    //           ],
                    //           decoration: InputDecoration(
                    //             border: InputBorder.none,
                    //             hintText: "Height",
                    //             hintStyle: GoogleFonts.inter(
                    //               fontWeight: FontWeight.w300,
                    //               fontSize: 12,
                    //               color: Colors.grey,
                    //             ),
                    //           ),
                    //           onChanged: (value) {},
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(width: 7),
                    //     Expanded(
                    //       child: Container(
                    //         padding: const EdgeInsets.symmetric(horizontal: 25),
                    //         height: 50,
                    //         decoration: BoxDecoration(
                    //           color: const Color.fromARGB(255, 247, 249, 251),
                    //           borderRadius: BorderRadius.circular(14),
                    //         ),
                    //         child: TextFormField(
                    //           controller: WeightController,
                    //           keyboardType: TextInputType.number,
                    //           inputFormatters: [
                    //             FilteringTextInputFormatter.digitsOnly
                    //           ],
                    //           decoration: InputDecoration(
                    //             border: InputBorder.none,
                    //             hintText: "weight",
                    //             hintStyle: GoogleFonts.inter(
                    //               fontWeight: FontWeight.w300,
                    //               fontSize: 12,
                    //               color: Colors.grey,
                    //             ),
                    //           ),
                    //           onChanged: (value) {},
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: mediaQueryData.size.height * 0.02),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       'Number of Cows: ${_currentSliderValue.toInt()}',
                    //       style: GoogleFonts.inter(
                    //         fontWeight: FontWeight.w300,
                    //         fontSize: 11.0,
                    //         color: Colors.grey.shade700,
                    //       ),
                    //     ),
                    //     Slider(
                    //       value: _currentSliderValue,
                    //       min: 0,
                    //       max: 200,
                    //       onChanged: (double newValue) {
                    //         setState(() {
                    //           _currentSliderValue = newValue;
                    //         });
                    //       },
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: mediaQueryData.size.height * 0.03),
                    CustomButton(
                      name: "Add Cow",
                      color: const Color.fromARGB(255, 56, 121, 233),
                      onPressed: () {
                        String cowID = idController.text;
                        String breed = breedController.text;
                        String subBreed = subBreedController.text;
                        String age = ageController.text;
                        String dob = DOBController.text;
                        String gender = selectedGender;
                        String color = ColourController.text;
                        String height = HeightContoller.text;
                        String weight = WeightController.text;
                        String inherent_Quality = selectedInherentQuality;
                        String description = DescriptionController.text;
                        String cost = CostController.text;

                        if (inherent_Quality == 'Purchased') {
                          if (cowID.isEmpty ||
                              breed.isEmpty ||
                              subBreed.isEmpty ||
                              age.isEmpty ||
                              dob.isEmpty ||
                              gender.isEmpty ||
                              color.isEmpty ||
                              height.isEmpty ||
                              weight.isEmpty ||
                              inherent_Quality.isEmpty ||
                              description.isEmpty ||
                              cost.isEmpty) {
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
                        } else {
                          Cow newCow = Cow(
                              CowID: cowID,
                              Breed: breed,
                              SubBreed: subBreed,
                              Age: age,
                              DOB: dob,
                              Gender: gender,
                              Color: color,
                              Height: height,
                              Weight: weight,
                              Inherent_Quality: inherent_Quality,
                              Description: description,
                              Cost: cost);
                          Navigator.pop(context, newCow);
                        }

                        if (inherent_Quality == 'Own') {
                          if (cowID.isEmpty ||
                              breed.isEmpty ||
                              subBreed.isEmpty ||
                              age.isEmpty ||
                              dob.isEmpty ||
                              gender.isEmpty ||
                              color.isEmpty ||
                              height.isEmpty ||
                              weight.isEmpty ||
                              inherent_Quality.isEmpty ||
                              description.isEmpty) {
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
                        } else {
                          Cow newCow = Cow(
                            CowID: cowID,
                            Breed: breed,
                            SubBreed: subBreed,
                            Age: age,
                            DOB: dob,
                            Gender: gender,
                            Color: color,
                            Height: height,
                            Weight: weight,
                            Inherent_Quality: inherent_Quality,
                            Description: description,
                          );
                          Navigator.pop(context, newCow);
                        }
                      },
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.02),
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

class Cow {
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

  Cow({
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
  });
}
