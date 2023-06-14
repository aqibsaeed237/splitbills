import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        SizedBox(width: 12),
                        Icon(
                          Icons.group,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
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
            // Add your start a new group section here
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Container(
                    height: 45,
                    width: 160,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.add,
                          color: Colors.white, // Icon color
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Add Expense',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.group,
                color: _selectedIndex == 0 ? Colors.teal : Colors.grey,
              ),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _selectedIndex == 1 ? Colors.teal : Colors.grey,
              ),
              label: 'Friends',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
                color: _selectedIndex == 2 ? Colors.teal : Colors.grey,
              ),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: _selectedIndex == 3 ? Colors.teal : Colors.grey,
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MainScreen());
}
