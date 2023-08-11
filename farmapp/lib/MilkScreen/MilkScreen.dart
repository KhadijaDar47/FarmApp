import 'package:farmapp/MilkScreen/AddMilk.dart';
import 'package:flutter/material.dart';
import '../Components/Clip.dart';
import 'package:google_fonts/google_fonts.dart';

class MilkMainScreen extends StatefulWidget {
  const MilkMainScreen({Key? key}) : super(key: key);

  @override
  State<MilkMainScreen> createState() => _MilkMainScreenState();
}

class _MilkMainScreenState extends State<MilkMainScreen> {
  List<Milk> milkData = [];
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget _appBar() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10),
            child: Icon(
              Icons.short_text,
              size: 30,
              color: Colors.black,
            ),
          ),
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 13.0, top: 10),
              child: Icon(
                Icons.notifications_none,
                size: 25,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    }

    Widget _header() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10),
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
                "Farm Owner",
                style: GoogleFonts.inter(
                    color: Colors.black87.withOpacity(0.8),
                    fontSize: 10,
                    fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ],
      );
    }

    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: milkData
                      .map((Milk) => CardSection(
                            title: Milk.MilkProduced.toString(),
                            value: Milk.CowsMilked.toString(),
                            // unit: "cows",
                            time: Milk.Time,
                            date: Milk.Date,
                            // isDone: false,
                            // image: const AssetImage('assets/icons/syringe.png'),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newMilk = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMilkScreen()),
          );

          if (newMilk != null && newMilk is Milk) {
            setState(() {
              milkData.add(newMilk);
            });
          }
        },
        backgroundColor: Color.fromARGB(255, 56, 121, 233),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CardSection extends StatelessWidget {
  final String title;
  final String value;
  final String date;
  final String time;

  CardSection({
    required this.title,
    required this.value,
    required this.date,
    required this.time,
  }) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: const EdgeInsets.only(right: 15.0),
          width: 440,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            shape: BoxShape.rectangle,
            color: Colors.white,
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                child: ClipPath(
                  clipper: MyCustomClipper(clipType: ClipType.semiCircle),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.lightBlue.withOpacity(0.1),
                    ),
                    height: 90,
                    width: 120,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${title} Litres',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${value} Cows ',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.0,
                                  letterSpacing: 0.8,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
