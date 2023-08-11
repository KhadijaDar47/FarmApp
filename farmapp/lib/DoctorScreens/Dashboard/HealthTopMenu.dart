import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../HealthScreen/MedicalHistory.dart';
import '../HealthScreen/MedicalStatus.dart';
import '../HealthScreen/TestScreen.dart';
import '../VaccinationScreen/VaccineScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class CupertinoSegmentedControlDemo extends StatefulWidget {
  const CupertinoSegmentedControlDemo({Key? key});

  @override
  State<CupertinoSegmentedControlDemo> createState() =>
      _CupertinoSegmentedControlDemoState();
}

class _CupertinoSegmentedControlDemoState
    extends State<CupertinoSegmentedControlDemo> with RestorationMixin {
  RestorableInt currentSegment = RestorableInt(0);
  final PageController _pageController = PageController(initialPage: 0);

  @override
  String get restorationId => 'cupertino_segmented_control';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(currentSegment, 'current_segment');
  }

  void onValueChanged(int? newValue) {
    setState(() {
      currentSegment.value = newValue!;
      _pageController.jumpToPage(currentSegment.value);
      selectedCategory = categories[currentSegment.value];
    });
  }

  List<String> categories = [
    "Health Status",
    "Vaccine",
    "Medical History",
    "Add Test"
  ];
  String selectedCategory = "Health Status";

  @override
  Widget build(BuildContext context) {
    final children = <int, Widget>{
      0: const MedicalStatusPage(),
      1: const VaccineHistoryScreen(),
      2: MedicalHistoryScreen(),
      3: const AddTestScreen(),
    };
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Animal's Medical\nInformation & Record",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 27, 27, 27),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategorieTile(
                      categorie: categories[index],
                      isSelected: selectedCategory == categories[index],
                      onTap: () {
                        setState(() {
                          selectedCategory = categories[index];
                          currentSegment.value = index;
                          _pageController.jumpToPage(currentSegment.value);
                        });
                      },
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: mediaQueryData.size.height * .03),
            Expanded(
              child: PageView.builder(
                itemCount: children.length,
                controller: _pageController,
                onPageChanged: onValueChanged,
                itemBuilder: (context, index) {
                  return children[index]!;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategorieTile extends StatelessWidget {
  final String? categorie;
  final bool? isSelected;
  final VoidCallback? onTap;

  CategorieTile({this.categorie, this.isSelected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected!
                ? const Color.fromARGB(255, 56, 121, 233)
                : Colors.grey.shade100, // Adjust background color here
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            categorie!,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 8.0,
              color: isSelected! ? Colors.white : const Color(0xffA1A1A1),
            ),
          ),
        ),
      ),
    );
  }
}
