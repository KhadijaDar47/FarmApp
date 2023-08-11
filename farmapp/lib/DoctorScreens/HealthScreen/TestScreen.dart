import "package:flutter/material.dart";

import 'package:google_fonts/google_fonts.dart';

import '../../Components/Checkbox.dart';

class AddTestScreen extends StatefulWidget {
  const AddTestScreen({Key? key}) : super(key: key);

  @override
  State<AddTestScreen> createState() => _AddTestScreenState();
}

class _AddTestScreenState extends State<AddTestScreen> {
  List<Map<String, String>> addedTests = []; // Specify the type explicitly
  final _testNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _showAddTestDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String newRecommendation = '';

        return AlertDialog(
          title: const Text('Add Test and Recommendation'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _testNameController,
                  onChanged: (value) {
                    // No need to use this onChanged here, as we're using Form validation.
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Test name is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Test'),
                ),
                TextField(
                  onChanged: (value) {
                    newRecommendation = value;
                  },
                  decoration:
                      const InputDecoration(labelText: 'Recommendation'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    final newTest = _testNameController.text;
                    if (newRecommendation.isEmpty) {
                      newRecommendation = 'Not Any';
                    }
                    addedTests.add({
                      'test': newTest,
                      'recommendation': newRecommendation,
                    });
                  });
                  _testNameController.text = "";
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _testNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Assigned Tests",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: const Color.fromARGB(255, 27, 27, 27),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      onPressed: _showAddTestDialog,
                      icon: const Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 56, 121, 233),
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (addedTests.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: addedTests.length,
                    itemBuilder: (context, index) {
                      final test = addedTests[index]['test'];
                      final recommendation =
                          addedTests[index]['recommendation'];

                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                test!,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0,
                                  color: Colors.grey.shade900,
                                ),
                              ),
                              if (recommendation != null &&
                                  recommendation.isNotEmpty)
                                Text(
                                  "Doctor's Recommeddation: $recommendation",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 8.0,
                                    color: Colors.grey.shade900,
                                  ),
                                ),
                              if (recommendation == null ||
                                  recommendation.isEmpty)
                                Text(
                                  'Not Any',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 8.0,
                                    color: Colors.grey.shade900,
                                  ),
                                ),
                              SizedBox(
                                  height: mediaQueryData.size.height * 0.02),
                              Row(
                                children: [
                                  SquareCheckbox(),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Tested',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
