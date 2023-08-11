import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SalaryPage extends StatefulWidget {
  const SalaryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SalaryPageState createState() => _SalaryPageState();
}

class _SalaryPageState extends State<SalaryPage> {
  final Map<String, double> employeeSalaries = {
    'Employee 1': 3000.0,
    'Employee 2': 3500.0,
    'Employee 3': 4000.0,
    'Employee 4': 4000.0,
    'Employee 5': 4000.0,
    'Employee 6': 4000.0,
    'Employee 7': 4000.0,
    'Employee 8': 4000.0,
    'Employee 9': 4000.0,
  };

  String selectedEmployee = 'Employee 1';
  Map<String, List<double>> employeeExpenses = {};
  final dailyExpenseController = TextEditingController();

  void addExpense(double amount) {
    setState(() {
      employeeExpenses[selectedEmployee] ??= [];
      employeeExpenses[selectedEmployee]!.add(amount);
    });
    dailyExpenseController.clear();
  }

  double calculateTotalExpenses() {
    return employeeExpenses[selectedEmployee]
            ?.fold(0.0, (sum, expense) => sum! + expense) ??
        0.0;
  }

  double calculateRemainingSalary() {
    double totalExpense = calculateTotalExpenses();
    double selectedEmployeeSalary = employeeSalaries[selectedEmployee]!;
    return selectedEmployeeSalary - totalExpense;
  }

  Widget buildExpenseListItem(double expenseAmount, BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.all(10.0),
                child: const Icon(
                  Icons.payment_outlined,
                  color: Colors.blue,
                  size: 20.0,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('MMMM dd, yyyy').format(DateTime.now()),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Mailk Man',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w200,
                      fontSize: 8.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Container(
                width: mediaQueryData.size.width - 260,
                alignment: Alignment.centerRight,
                child: Text(
                  '- Rs.${expenseAmount.toInt()}',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Divider(
              thickness: 0.3,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black87),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Salary track of all \nEmployees",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomCard(
                      title: 'Total Income',
                      color: const Color.fromARGB(255, 240, 249, 243),
                      icon: Icons.arrow_upward,
                      IconColors: const Color.fromARGB(255, 73, 183, 111),
                      Amount: employeeSalaries[selectedEmployee],
                    ),
                    CustomCard(
                      title: 'Remaining Salary',
                      color: const Color.fromARGB(255, 254, 241, 242),
                      icon: Icons.arrow_downward,
                      IconColors: const Color.fromARGB(255, 242, 85, 94),
                      Amount: calculateRemainingSalary(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
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
                        readOnly: true,
                        controller:
                            TextEditingController(text: selectedEmployee),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "Select Employee",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView(
                                      children:
                                          employeeSalaries.keys.map((employee) {
                                        return ListTile(
                                          title: Text(
                                            employee,
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              selectedEmployee = employee;
                                              Navigator.pop(context);
                                            });
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          border: InputBorder.none,
                          labelStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue,
                    ),
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        _showAddExpenseDialog();
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Activity",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: employeeExpenses[selectedEmployee]?.length ?? 0,
                  itemBuilder: (context, index) {
                    double expenseAmount =
                        employeeExpenses[selectedEmployee]![index];
                    return buildExpenseListItem(expenseAmount, context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showAddExpenseDialog() async {
    double? enteredAmount;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Expense"),
          content: TextFormField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onChanged: (value) {
              enteredAmount = double.tryParse(value);
            },
            decoration: const InputDecoration(labelText: "Enter Amount"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (enteredAmount != null) {
                  addExpense(enteredAmount!);
                  Navigator.pop(context);
                }
              },
              child: const Text("Add"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final double? Amount;
  final Color color;
  final Color IconColors;
  final IconData icon;

  const CustomCard({
    super.key,
    required this.title,
    required this.Amount,
    required this.color,
    required this.IconColors,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    String amountString = (Amount ?? 0.0).toStringAsFixed(0);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      width: mediaQueryData.size.width / 2.3,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
              color: IconColors,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(icon, color: Colors.white, size: 17),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rs.$amountString",
                style: GoogleFonts.inter(
                    color: IconColors,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              Text(
                title,
                style: GoogleFonts.inter(
                    color: IconColors,
                    fontWeight: FontWeight.w200,
                    fontSize: 9),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
