import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/CustomButton.dart';
// Import the CustomButton and Farm classes if they are implemented in your project

class AddFeedScreen extends StatefulWidget {
  const AddFeedScreen({Key? key}) : super(key: key);

  @override
  State<AddFeedScreen> createState() => _AddFeedScreenState();
}

class _AddFeedScreenState extends State<AddFeedScreen> {
  double _currentSliderValue = 0;
  final feedNameController = TextEditingController();
  final quantityController = TextEditingController();
  final costController = TextEditingController();
  var selectedValue;
  void initState() {
    super.initState();
    selectedValue = "Own";
    // DateController.text = DateFormat('MM/dd/yyyy').format(DateTime.now());
  }
  // final EmployeeController = TextEditingController();

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
                "Feed Information",
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Information about the feed",
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
                    "Enter Feed Information ",
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
                        controller: feedNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Feed Name",
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
                        controller: quantityController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Quantity",
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
                            child: DropdownButtonFormField<String>(
                              value: selectedValue,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedValue = newValue;
                                });
                              },
                              items: <String>[
                                'Own',
                                'Purchased'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Feed Type",
                                hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Expanded(
                          child: Visibility(
                            visible: selectedValue == 'Purchased',
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 247, 249, 251),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: TextField(
                                controller: costController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Cost',
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
                      ],
                    ),
                    SizedBox(height: mediaQueryData.size.height * 0.03),
                    CustomButton(
                      name: "Add Feed",
                      color: const Color.fromARGB(255, 56, 121, 233),
                      onPressed: () {
                        String fname = feedNameController.text.trim();
                        String fquantity = quantityController.text.trim();
                        String ftype = selectedValue.toString();

                        String fcost = costController.text.trim();

                        if (fname.isEmpty ||
                            fquantity.isEmpty ||
                            ftype.isEmpty ||
                            ftype == 'Purchased') {
                          if (fcost.isEmpty) {
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
                          }
                        }

                        Feed newFeed = Feed(
                            feedName: fname,
                            quantity: fquantity,
                            feedType: ftype,
                            cost: fcost);

                        Navigator.pop(context, newFeed);
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

class Feed {
  final String feedName;
  final String quantity;
  final String feedType;
  final String? cost;

  Feed({
    required this.feedName,
    required this.quantity,
    required this.feedType,
    this.cost,
  });
}
