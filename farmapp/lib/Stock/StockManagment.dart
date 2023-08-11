import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class StockManagementScreen extends StatefulWidget {
  @override
  _StockManagementScreenState createState() => _StockManagementScreenState();
}

class _StockManagementScreenState extends State<StockManagementScreen> {
  List<String> categories = ['Milk', 'Medicine', 'Feed', "Cows"];
  Map<String, int> stockMap = {
    'Milk': 30,
    'Medicine': 50,
    'Feed': 40,
    'Cows': 2
  };
  List<String> stockHistory = [];
  void addStock(String category, int amount) {
    setState(() {
      if (stockMap.containsKey(category)) {
        stockMap[category] = (stockMap[category] ?? 0) + amount;
      } else {
        stockMap[category] = amount;
        categories.add(category);
      }
      stockHistory.add('$category: $amount');
    });
  }

  Widget _buildHistoryList() {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'History',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'View More',
                style: GoogleFonts.inter(
                    fontSize: 8,
                    fontWeight: FontWeight.w200,
                    color: Colors.orange),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: stockHistory.length,
            itemBuilder: (context, index) {
              String historyItem = stockHistory[index];
              String category = historyItem.split(":")[0];
              String amount = historyItem.split(":")[1].trim();
              bool isAddition = amount.contains("-");

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: isAddition
                                ? Colors.red.withOpacity(0.1)
                                : Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            isAddition
                                ? Icons.arrow_drop_down_rounded
                                : Icons.arrow_drop_up_rounded,
                            color: isAddition ? Colors.red : Colors.blue,
                            size: 20.0,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                category,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.0,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                DateFormat('MMMM dd, yyyy')
                                    .format(DateTime.now()),
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 8.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              isAddition
                                  ? Icons.arrow_drop_down_rounded
                                  : Icons.arrow_drop_up_rounded,
                              color: isAddition ? Colors.red : Colors.green,
                              size: 24.0,
                            ),
                            Text(
                              amount,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
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
            },
          ),
        ),
      ],
    );
  }

  void _showAddCategoryDialog() {
    String categoryName = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Category'),
          content: TextField(
            onChanged: (value) {
              categoryName = value;
            },
            decoration: const InputDecoration(
              labelText: 'Category Name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (categoryName.isNotEmpty) {
                  stockMap[categoryName] = 0;

                  if (!categories.contains(categoryName)) {
                    setState(() {
                      categories.add(categoryName);
                    });
                  }
                }
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Stock",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showAddCategoryDialog();
                  },
                  child: Text(
                    "Add More",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        fontSize: 8,
                        fontWeight: FontWeight.w200,
                        color: Colors.orange),
                  ),
                ),
              ],
            ),
            Container(
              height: 130, // Set the height of the horizontal list
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Set the scroll direction
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  String category = categories[index];
                  int stock = stockMap[category] ?? 0;

                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: _buildCategoryListItem(category, stock),
                  );
                },
              ),
            ),
            Expanded(child: _buildHistoryList()),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryListItem(String category, int stock) {
    return GestureDetector(
      onTap: () {
        _showAddStockDialog(selectedCategory: category);
      },
      child: Container(
        width: 110,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: Text(
                    '$stock',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      color: Colors.black87.withOpacity(0.8),
                    ),
                  ),
                ),
                Text(
                  category.toUpperCase(),
                  style: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 8,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddStockDialog({String? selectedCategory}) {
    int amount = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Manage Stock'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Text(
                  //   'Category: $selectedCategory', // Display the selected category
                  //   style: GoogleFonts.inter(
                  //     fontWeight: FontWeight.w600,
                  //     fontSize: 12.0,
                  //     color: Colors.black,
                  //   ),
                  // ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            amount = int.tryParse(value) ?? 0;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Amount',
                          ),
                        ),
                      ),
                      Icon(
                        amount < 0
                            ? Icons.arrow_drop_down_rounded
                            : Icons.arrow_drop_up_rounded,
                        color: amount < 0 ? Colors.red : Colors.green,
                        size: 20.0,
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      amount = -amount; // Negative amount for removal
                    });
                    addStock(selectedCategory!, amount);

                    // Check if the category already exists in the list
                    if (!categories.contains(selectedCategory)) {
                      setState(() {
                        categories.add(selectedCategory);
                      });
                    }

                    Navigator.of(context).pop();
                  },
                  child: const Text('Remove'),
                ),
                ElevatedButton(
                  onPressed: () {
                    addStock(selectedCategory!, amount);

                    Navigator.of(context).pop();
                  },
                  child: const Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
