import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/CustomButton.dart';
// Import the CustomButton and Farm classes if they are implemented in your project

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final qualificationController = TextEditingController();
  final whrsController = TextEditingController();
  final salaryController = TextEditingController();
  String selectedType = 'Employee';
  String selectedGender = 'Male';
  bool isActive = false;

  @override
  void initState() {
    // TODO: implement initState
    selectedType;
    selectedGender;
    super.initState();
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
                "Employee Information",
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Information about the Employee",
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
                    "Enter Employee Information ",
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
                      child: DropdownButtonFormField<String>(
                        value:
                            selectedType, // Add a variable to hold the selected value
                        onChanged: (newValue) {
                          setState(() {
                            selectedType =
                                newValue!; // Update the selected value
                          });
                        },
                        items: [
                          DropdownMenuItem(
                            value: 'Employee', // Add your values here
                            child: Text('Employee'),
                          ),
                          DropdownMenuItem(
                            value: 'Daily Wager',
                            child: Text('Daily Wager'),
                          ),
                          // Add more DropdownMenuItem as needed
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type",
                          hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
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
                        controller: nameController,
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
                    Visibility(
                      visible: selectedType == 'Employee',
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 249, 251),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
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
                    Visibility(
                      visible: selectedType == 'Employee',
                      child: SizedBox(
                        height: mediaQueryData.size.height * 0.01,
                      ),
                    ),
                    Visibility(
                      visible: selectedType == 'Employee',
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 249, 251),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextFormField(
                          controller: qualificationController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Qualification",
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
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone Number",
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
                        value:
                            selectedGender, // Add a variable to hold the selected value
                        onChanged: (newValue) {
                          setState(() {
                            selectedGender =
                                newValue!; // Update the selected value
                          });
                        },
                        items: [
                          DropdownMenuItem(
                            value: 'Male', // Add your values here
                            child: Text('Male'),
                          ),
                          DropdownMenuItem(
                            value: 'Female',
                            child: Text('Female'),
                          ),
                          // Add more DropdownMenuItem as needed
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Gender",
                          hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
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
                              controller: dobController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
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
                              controller: whrsController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Working Hours",
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
                      child: TextFormField(
                        controller: salaryController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Salary",
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isActive
                                ? 'Active'
                                : 'Inactive', // Displayed label text based on isActive
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          Switch(
                            value: isActive,
                            onChanged: (value) {
                              setState(() {
                                isActive = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.03),
                    CustomButton(
                      name: "Add Staff",
                      color: const Color.fromARGB(255, 56, 121, 233),
                      onPressed: () {
                        String Status;
                        String Name = nameController.text;
                        String dob = dobController.text;
                        String Phone = phoneNumberController.text;
                        isActive == true
                            ? Status = 'Active'
                            : Status = 'Inactive';
                        String Email = emailController.text;
                        String Gender = selectedGender;
                        String Qualification = qualificationController.text;
                        String Type = selectedType;
                        String Salary = salaryController.text;
                        String WHRS = whrsController.text;
                        print('Name: ' +
                            Name +
                            'Phone: ' +
                            Phone +
                            'Gender: ' +
                            Gender +
                            'Type: ' +
                            Type +
                            'Salary: ' +
                            Salary +
                            'Dob: ' +
                            dob +
                            'Status: ' +
                            Status);

                        // Validation logic

                        if (selectedType == 'Employee') {
                          if (Email.isEmpty ||
                              Qualification.isEmpty ||
                              Name.isEmpty ||
                              Phone.isEmpty ||
                              dob.isEmpty ||
                              Gender.isEmpty ||
                              Type.isEmpty ||
                              Salary.isEmpty ||
                              WHRS.isEmpty) {
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
                          staff newStaff = staff(
                              name: Name,
                              DOB: dob,
                              phoneNumber: Phone,
                              status: Status,
                              email: Email,
                              gender: Gender,
                              qualification: Qualification,
                              salary: Salary,
                              type: Type,
                              workHRS: WHRS);
                          Navigator.pop(context, newStaff);
                        }
                        if (selectedType == 'Daily Wager') {
                          if (Name.isEmpty ||
                              Phone.isEmpty ||
                              dob.isEmpty ||
                              Gender.isEmpty ||
                              Type.isEmpty ||
                              Salary.isEmpty ||
                              WHRS.isEmpty && selectedType == 'Daily Wager') {
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
                          staff newStaff = staff(
                              name: Name,
                              DOB: dob,
                              phoneNumber: Phone,
                              status: Status,
                              // email: Email,
                              gender: Gender,
                              // qualification: Qualification,
                              salary: Salary,
                              type: Type,
                              workHRS: WHRS);
                          Navigator.pop(context, newStaff);
                        }
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

class staff {
  final String name;
  final String DOB;
  final String phoneNumber;
  final String status;
  String? email;
  final String gender;
  String? qualification;
  final String type;
  final String salary;
  final String workHRS;

  staff(
      {required this.name,
      required this.DOB,
      required this.phoneNumber,
      required this.status,
      this.email,
      required this.gender,
      this.qualification,
      required this.type,
      required this.salary,
      required this.workHRS});
}
