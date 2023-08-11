import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Expense/ExpenseScreen.dart';
import '../Expense/Salary.dart';
import 'StockManagment.dart';

class StockDashBoard extends StatefulWidget {
  const StockDashBoard({super.key});

  @override
  State<StockDashBoard> createState() => _StockDashBoardState();
}

class _StockDashBoardState extends State<StockDashBoard> {
  PreferredSizeWidget _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(
          kToolbarHeight), // Set your preferred height here
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.only(left: 25.0, top: 10),
          child: Icon(
            Icons.short_text,
            size: 30,
            color: Colors.black,
          ),
        ),
        actions: const <Widget>[
          Padding(
            padding:
                EdgeInsets.only(right: 10.0, top: 10), // Add right padding here
            child: Icon(
              Icons.notifications_none,
              size: 25,
              color: Colors.black,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 10.0, top: 10),
          //   child: CircleAvatar(
          //     radius: 20,
          //     backgroundColor: Colors.white,
          //     child: ClipOval(
          //       child: Image.asset("assets/images/user.png"),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  late List<SpecialityModel> specialities;

  @override
  void initState() {
    super.initState();

    specialities = getSpeciality();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 3),
              child: Text(
                DateFormat('MMMM dd, yyyy').format(DateTime.now()),
                style: GoogleFonts.inter(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Transactions and \nFinance",
                style: GoogleFonts.inter(
                    color: Colors.black87.withOpacity(0.8),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 249, 251),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search",
                    hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                height: 100,
                child: ListView.separated(
                  itemCount: specialities.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16.0);
                  },
                  itemBuilder: (context, index) {
                    return SpecialistTile(
                      speciality: specialities[index].speciality,
                      noOfDoctors: specialities[index].noOfDoctors,
                      backColor: specialities[index].backgroundColor,
                      onPressed: () {},
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<SpecialityModel> getSpeciality() {
  List<SpecialityModel> specialities = [];
  SpecialityModel specialityModel = SpecialityModel();

  //1
  specialityModel.noOfDoctors = "Manage Stocks";
  specialityModel.speciality = "Stocks";
  specialityModel.backgroundColor = const Color.fromARGB(255, 247, 249, 251);
  specialities.add(specialityModel);
  specialityModel = SpecialityModel();

  //2
  specialityModel.noOfDoctors = "Manage Farm Expenses";
  specialityModel.speciality = "Expenses";
  specialityModel.backgroundColor = const Color.fromARGB(255, 247, 249, 251);
  specialities.add(specialityModel);
  specialityModel = SpecialityModel();

  //3
  specialityModel.noOfDoctors = "Employee Salary";
  specialityModel.speciality = "Salary";
  specialityModel.backgroundColor = const Color.fromARGB(255, 247, 249, 251);
  specialities.add(specialityModel);
  specialityModel = SpecialityModel();

  return specialities;
}

class SpecialityModel {
  String? speciality;
  String? noOfDoctors;
  Color? backgroundColor;
  VoidCallback? onPressed;
  SpecialityModel(
      {this.speciality,
      this.noOfDoctors,
      this.onPressed,
      this.backgroundColor});
}

class SpecialistTile extends StatelessWidget {
  final String? speciality;
  final String? noOfDoctors;
  final Color? backColor;
  final VoidCallback onPressed;
  const SpecialistTile(
      {super.key,
      required this.speciality,
      required this.noOfDoctors,
      required this.onPressed,
      required this.backColor});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {
        if (speciality == "Stocks") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StockManagementScreen()),
          );
        } else if (speciality == "Expenses") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ExpenseScreen()),
          );
        } else if (speciality == "Salary") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SalaryPage()),
          );
        }
      },
      child: Card(
        child: Container(
          margin: const EdgeInsets.all(10),
          width: mediaQueryData.size.width / 5.5,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Adjust alignment
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              SizedBox(
                width: 20,
                height: 20,
                child: Image.asset("assets/images/stock.png"),
              ),
              Text(
                speciality!,
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
