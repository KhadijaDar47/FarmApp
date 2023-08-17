import 'package:flutter/material.dart';

import '../Expense/expenseDashboard.dart';
import '../dashboards/dash.dart';

class CustomDrawer extends StatelessWidget {
  final String userRole;

  const CustomDrawer({super.key, required this.userRole});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/profile_image.jpg'),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(Icons.person),
              onTap: () {
                // Handle Profile tap
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ProfileScreen(),
                //   ),
                // );
              },
            ),
            if (userRole == 'Admin') ...[
              ListTile(
                title: const Text('Home'),
                leading: const Icon(Icons.dashboard),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CardBasicRoute(),
                    ),
                  );
                },
              ),
              ExpansionTile(
                title: const Text('Employee Details'),
                leading: const Icon(Icons.emoji_people_rounded),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 8, top: 8, bottom: 2),
                    child: ListTile(
                      title: const Text('Add Employee'),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const CategoriesAdmin(),
                        //   ),
                        // );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 8, top: 1, bottom: 2),
                    child: ListTile(
                      title: const Text('View Employee'),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const CategoriesAdmin(),
                        //   ),
                        // );
                      },
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text('Cow Details'),
                leading: const Icon(Icons.info_outline),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     // builder: (context) => const TabPage(),
                  //   ),
                  // );
                },
              ),
              ListTile(
                title: const Text('Farm Details'),
                leading: const Icon(Icons.home_filled),
                onTap: () {
                  // Handle Sales tap
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SaleScreen(),
                  //   ),
                  // );
                },
              ),
              ListTile(
                title: const Text('Expense Details'),
                leading: const Icon(Icons.note),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExpenseDashboard(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Reports'),
                leading: const Icon(Icons.report),
                onTap: () {
                  // Handle Expense tap
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const ExpenseScreen(),
                  //   ),
                  // );
                },
              ),
              // ListTile(
              //   title: const Text('Expenses'),
              //   leading: const Icon(Icons.money_off),
              //   onTap: () {
              //     // Handle Expense tap
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(
              //     //     builder: (context) => const ExpenseScreen(),
              //     //   ),
              //     // );
              //   },
              // ),
            ],
            if (userRole == 'User') ...[
              ListTile(
                title: const Text('Category'),
                leading: const Icon(Icons.category),
                onTap: () {
                  // Handle Category tap
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const CategoriesGU(),
                  //   ),
                  // );
                },
              ),
              ListTile(
                title: const Text('Item'),
                leading: const Icon(Icons.shopping_bag),
                onTap: () {
                  // Handle Item tap
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const ItemsList(),
                  //   ),
                  // );
                },
              ),
              ListTile(
                title: const Text('Collection'),
                leading: const Icon(Icons.payment),
                onTap: () {
                  // Handle Collection tap
                },
              ),
            ],
            if (userRole == 'Guest') ...[
              ListTile(
                title: const Text('Profile'),
                leading: const Icon(Icons.person),
                onTap: () {
                  // Handle Profile tap
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const ProfileScreen(),
                  //   ),
                  // );
                },
              ),
              ListTile(
                title: const Text(
                    'Make Order'), //********************************** */
                leading: const Icon(Icons.shopping_cart),
                onTap: () {
                  // Handle Make Order tap
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => CartScreen(),
                  //   ),
                  // );
                },
              ),
              ListTile(
                title: const Text('Payment'),
                leading: const Icon(Icons.payment),
                onTap: () {
                  // Handle Payment tap
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PaymentScreen(),
                  //   ),
                  // );
                },
              ),
              ListTile(
                title: const Text('Address'),
                leading: const Icon(Icons.location_on),
                onTap: () {
                  // Handle Address tap
                },
              ),
              ListTile(
                title: const Text('Category'),
                leading: const Icon(Icons.category),
                onTap: () {
                  // Handle Category tap
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const CategoriesGU(),
                  //   ),
                  // );
                },
              ),
              ListTile(
                title: const Text('Items'),
                leading: const Icon(Icons.shopping_basket),
                onTap: () {
                  // Handle Items tap
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const ItemsList(),
                  //   ),
                  // );
                },
              ),
            ],
            const Divider(),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout),
              onTap: () {
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(builder: (context) => const LoginScreen()),
                //   (Route<dynamic> route) => false,
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
