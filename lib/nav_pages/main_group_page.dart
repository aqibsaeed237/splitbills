import 'package:flutter/material.dart';
import 'package:splitbills/nav_pages/nav_controller_helper_pages/add_expense_page.dart';
import 'package:splitbills/nav_pages/nav_controller_helper_pages/create_group_pages.dart';

class MainGroupPage extends StatefulWidget {
  const MainGroupPage({Key? key}) : super(key: key);

  @override
  State<MainGroupPage> createState() => _MainGroupPageState();
}

class _MainGroupPageState extends State<MainGroupPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                SizedBox(width: 14),
                Icon(
                  Icons.group,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 14,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 24,
                  ),
                  child: Text(
                    'You are all settled up!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.filter_list,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // Handle filter icon press
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    // Half the width/height to make it circular
                    color: Colors.grey[200],
                    // Background color
                    image: const DecorationImage(
                      image: AssetImage('assets/images/ravatar.jpg'),
                      // Replace with your desired background image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            // Add your container and ScrollView here

            const SizedBox(height: 30),
            const Text(
              'No group to show',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 30),
            SizedBox(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateGroupPage()));
                },
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.teal, // Border color
                      width: 1.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(4.0), // Rounded corners
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.group,
                        color: Colors.teal, // Icon color
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Start a new group',
                        style: TextStyle(
                          color: Colors.teal, // Text color
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Add your start a new group section here
            const SizedBox(
              height: 80,
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddExpense()));
          },
          label: const Text("Add expense"),
          icon: const Icon(
            Icons.add,
            color: Colors.white, // Icon color
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
