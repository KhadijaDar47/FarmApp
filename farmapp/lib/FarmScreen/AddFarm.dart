import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/CustomButton.dart';
// Import the CustomButton and Farm classes if they are implemented in your project

class AddFarmScreen extends StatefulWidget {
  const AddFarmScreen({Key? key}) : super(key: key);

  @override
  State<AddFarmScreen> createState() => _AddFarmScreenState();
}

class _AddFarmScreenState extends State<AddFarmScreen> {
  double _currentSliderValue = 0;
  final NameController = TextEditingController();
  final AddressController = TextEditingController();
  final DoctorController = TextEditingController();
  final EmployeeController = TextEditingController();

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
                      child: TextFormField(
                        controller: NameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Name",
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
                        controller: AddressController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Address",
                          hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
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
                    SizedBox(height: mediaQueryData.size.height * 0.02),
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
                              controller: DoctorController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "No. of Doctors",
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
                              controller: EmployeeController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "No. Of Employees",
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
                    SizedBox(height: mediaQueryData.size.height * 0.02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Number of Cows: ${_currentSliderValue.toInt()}',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w300,
                            fontSize: 11.0,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Slider(
                          value: _currentSliderValue,
                          min: 0,
                          max: 200,
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
                      name: "Add Farm",
                      color: const Color.fromARGB(255, 56, 121, 233),
                      onPressed: () {
                        String name = NameController.text.trim();
                        String address = AddressController.text.trim();
                        String doctorsText = DoctorController.text.trim();
                        String employeesText = EmployeeController.text.trim();

                        if (name.isEmpty ||
                            address.isEmpty ||
                            doctorsText.isEmpty ||
                            employeesText.isEmpty) {
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

                        Farm newFarm = Farm(
                          name: name,
                          address: address,
                          doctors: int.parse(doctorsText),
                          employees: int.parse(employeesText),
                          cows: _currentSliderValue.toInt(),
                        );
                        Navigator.pop(context, newFarm);
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

class Farm {
  final String name;
  final String address;
  final int doctors;
  final int employees;
  final int cows;

  Farm({
    required this.name,
    required this.address,
    required this.doctors,
    required this.employees,
    required this.cows,
  });
}
