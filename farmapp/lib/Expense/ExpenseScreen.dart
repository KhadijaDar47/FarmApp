import 'package:farmapp/Expense/expenseDashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  List<Map<String, dynamic>> expensesList = [];
  double bankAmount = 0;
  double expenseAmount = 0;
  String selectedExpenseType = '';

  void addExpense(Map<String, dynamic> expenseDetails) {
    setState(() {
      expensesList.add(expenseDetails);
      if (expenseDetails['expenseType'] == 'Deposit') {
        bankAmount += expenseDetails['amount'];
      } else {
        expenseAmount += expenseDetails['amount'];
      }
    });
  }

  Map<String, IconData> expenseTypeIcons = {
    'Deposit': Icons.attach_money_outlined,
    'Bill': Icons.receipt_long_rounded,
    'Travel': Icons.moped_outlined,
    'Farm Items': Icons.shopping_bag_outlined,
    'Maintenance': Icons.construction_outlined,
    'Other': Icons.miscellaneous_services_outlined,
  };
  List expenses = [
    {
      "icon": Icons.arrow_back,
      "color": Colors.blue,
      "label": "Bank",
      "cost": "getTotalIncome()"
    },
    {
      "icon": Icons.arrow_forward,
      "color": Colors.red,
      "label": "Expense",
      "cost": "getTotalExpenses()"
    }
  ];

  Widget buildExpenseListItem(
      Map<String, dynamic> expense, BuildContext context) {
    final IconData expenseIcon =
        expenseTypeIcons[expense['expenseType']] ?? Icons.attach_money_outlined;
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    Color amountColor = Colors.red; // Default color for expenses
    if (expense['expenseType'] == 'Deposit') {
      amountColor = Colors.green; // Change color to green for deposits
    }
    String amountPrefix = '- '; // Default prefix for expenses
    if (expense['expenseType'] == 'Deposit') {
      amountColor = Colors.green; // Change color to green for deposits
      amountPrefix = '+ '; // Change prefix to "+" for deposits
    }
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
                child: Icon(
                  expenseIcon,
                  color: Colors.blue,
                  size: 20.0,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${expense['expenseType']}',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    expense['Date'],
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w200,
                      fontSize: 8.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Container(
                width: mediaQueryData.size.width - 210,
                alignment: Alignment.centerRight,
                child: Text(
                  '$amountPrefix Rs.${expense['amount'].toInt()}',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    color: amountColor,
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 15),
            Row(
              children: [
                Wrap(
                    spacing: 2,
                    children: List.generate(expenses.length, (index) {
                      return Card(
                        child: Container(
                          width: (size.width - 69) / 2,
                          height: 170,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.01),
                                  spreadRadius: 10,
                                  blurRadius: 3,
                                  // changes position of shadow
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 15, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: expenses[index]['color']),
                                  child: Center(
                                      child: Icon(
                                    expenses[index]['icon'],
                                    color: Colors.white,
                                  )),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      expenses[index]['label'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                          color: Color(0xff67727d)),
                                    ),
                                    Text(
                                      expenses[index]['label'] == 'Bank'
                                          ? 'Rs. ${bankAmount.toStringAsFixed(0)}'
                                          : 'Rs. ${expenseAmount.toStringAsFixed(0)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: transactionTypes.length,
                itemBuilder: (context, index) {
                  final type = transactionTypes[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedExpenseType = type['name'];
                      });
                      showDialog(
                        context: context,
                        builder: (context) => AddExpenseDialog(
                          onExpenseAdded:
                              addExpense, // Pass the required argument here
                          selectedExpenseType: selectedExpenseType,
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Column(
                        children: [
                          Container(
                            width: 53,
                            height: 53,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedExpenseType == type['name']
                                  ? const Color.fromARGB(255, 222, 234, 252)
                                  : Colors.blue.withOpacity(0.1),
                            ),
                            child: Center(
                              child: Icon(
                                type['icon'],
                                color: Colors.blue,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            type['name'],
                            style: const TextStyle(
                              fontSize: 7,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Today transactions',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'View all',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w300,
                      fontSize: 8.0,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: expensesList.length,
                itemBuilder: (context, index) {
                  final expense = expensesList[index];
                  return buildExpenseListItem(expense, context);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the next screen when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const ExpenseDashboard(), // Replace with the actual next screen
            ),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0XFF2879E9),
          ),
          child: const Icon(
            Icons.arrow_forward,
          ),
        ),
      ),
    );
  }
}

class AddExpenseDialog extends StatefulWidget {
  final Function(Map<String, dynamic>) onExpenseAdded;
  final String selectedExpenseType;

  const AddExpenseDialog({
    required this.onExpenseAdded,
    required this.selectedExpenseType,
    Key? key,
  }) : super(key: key);

  @override
  _AddExpenseDialogState createState() => _AddExpenseDialogState();
}

class _AddExpenseDialogState extends State<AddExpenseDialog> {
  final _amountController = TextEditingController();
  String _expenseDetails = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                onChanged: (value) {
                  _expenseDetails = value;
                },
                decoration: const InputDecoration(labelText: 'Expense Details'),
              ),
              TextFormField(
                controller: _amountController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Amount is required';
                  }
                  final amount = double.tryParse(value);
                  if (amount == null) {
                    return 'Invalid amount';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Amount'),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final amount = double.tryParse(_amountController.text);
              if (amount != null) {
                final Map<String, dynamic> expenseDetails = {
                  'amount': amount,
                  'expenseType': widget.selectedExpenseType,
                  'expenseDetails': _expenseDetails,
                  'Date': DateFormat('MMMM dd, yyyy').format(DateTime.now())
                };
                widget.onExpenseAdded(expenseDetails);
              }
              Navigator.pop(context);
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}

const List<Map<String, dynamic>> transactionTypes = [
  {
    'icon': Icons.attach_money_outlined,
    'name': 'Deposit',
  },
  {
    'icon': Icons.receipt_long_rounded,
    'name': 'Bill',
  },
  {
    'icon': Icons.moped_outlined,
    'name': 'Travel',
  },
  {
    'icon': Icons.shopping_bag_outlined,
    'name': 'Farm Items',
  },
  {
    'icon': Icons.construction_outlined,
    'name': 'Maintenance',
  },
  {
    'icon': Icons.miscellaneous_services_outlined,
    'name': 'Other',
  },
];
