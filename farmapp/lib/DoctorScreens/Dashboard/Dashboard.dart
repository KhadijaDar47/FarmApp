import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../HealthScreen/HealthReport.dart';

String? selectedCategorie = "Adults";

class DoctorDashBoardScreen extends StatefulWidget {
  const DoctorDashBoardScreen({super.key});

  @override
  DoctorDashBoardScreenState createState() => DoctorDashBoardScreenState();
}

class DoctorDashBoardScreenState extends State<DoctorDashBoardScreen> {
  List<String> categories = ["Adults", "Childrens", "Womens", "Mens"];

  late List<SpecialityModel> specialities;

  @override
  void initState() {
    super.initState();

    specialities = getSpeciality();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black87),
        leading: const Icon(
          Icons.short_text_rounded,
          color: Colors.black87,
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0, top: 10),
            child: Icon(
              Icons.notifications_none,
              size: 25,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(child: Container()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 13.0),
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
                        "Dr. Salunkhe ",
                        style: GoogleFonts.inter(
                            color: Colors.black87.withOpacity(0.8),
                            fontSize: 10,
                            fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 249, 251),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Animal Medical History by ID",
                    hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: GoogleFonts.inter(
                        color: Colors.black87.withOpacity(0.8),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.inter(
                        color: Colors.orange,
                        fontSize: 7,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                    itemCount: specialities.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SpecialistTile(
                        imgAssetPath: specialities[index].imgAssetPath,
                        speciality: specialities[index].speciality,
                        noOfDoctors: specialities[index].noOfDoctors,
                        backColor: specialities[index].backgroundColor,
                        onPressed: () {},
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Other Doctors",
                style: GoogleFonts.inter(
                    color: Colors.black87.withOpacity(0.8),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              const DoctorsTile(),
              const SizedBox(
                height: 8,
              ),
              const DoctorsTile(),
              const SizedBox(
                height: 8,
              ),
              const DoctorsTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class SpecialistTile extends StatelessWidget {
  final String? imgAssetPath;
  final String? speciality;
  final String? noOfDoctors;
  final Color? backColor;
  final VoidCallback onPressed;
  SpecialistTile(
      {required this.imgAssetPath,
      required this.speciality,
      required this.noOfDoctors,
      required this.onPressed,
      required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 170,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                speciality!,
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                noOfDoctors!,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w200,
                  fontSize: 8.0,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 30,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HeathScreen()),
              );
            },
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class DoctorsTile extends StatelessWidget {
  const DoctorsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => DoctorsInfo()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 247, 249, 251),
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Row(
          children: <Widget>[
            Image.asset(
              "assets/images/doctor_pic.png",
              height: 50,
            ),
            const SizedBox(
              width: 17,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Dr. Stefeni Albert",
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Heart Speailist",
                  style: GoogleFonts.inter(
                      fontSize: 8, fontWeight: FontWeight.w300),
                )
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 56, 121, 233),
                  borderRadius: BorderRadius.circular(13)),
              child: Text(
                "Call",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<SpecialityModel> getSpeciality() {
  List<SpecialityModel> specialities = [];
  SpecialityModel specialityModel = new SpecialityModel();

  //1
  specialityModel.noOfDoctors = "Add Medication";
  specialityModel.speciality = "Medical History";
  specialityModel.imgAssetPath = "assets/images/img1.png";
  specialityModel.backgroundColor = const Color.fromARGB(255, 247, 249, 251);

  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  //2
  specialityModel.noOfDoctors = "Add & View Medical History";
  specialityModel.speciality = "Vaccination Record";
  specialityModel.imgAssetPath = "assets/images/img2.png";
  specialityModel.backgroundColor = const Color.fromARGB(255, 247, 249, 251);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  //3
  specialityModel.noOfDoctors = "View Medical History";
  specialityModel.speciality = "Medical Status";
  specialityModel.imgAssetPath = "assets/images/img3.png";
  specialityModel.backgroundColor = const Color.fromARGB(255, 247, 249, 251);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  return specialities;
}

class SpecialityModel {
  String? imgAssetPath;
  String? speciality;
  String? noOfDoctors;
  Color? backgroundColor;
  VoidCallback? onPressed;
  SpecialityModel(
      {this.imgAssetPath,
      this.speciality,
      this.noOfDoctors,
      this.onPressed,
      this.backgroundColor});
}
