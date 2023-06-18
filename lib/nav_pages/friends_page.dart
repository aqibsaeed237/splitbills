import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: [
            SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24),
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
                  padding: EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    icon: const Icon(Icons.filter_list),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
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
            // Add your start a new group section here
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Add expense"),
        icon: const Icon(
          Icons.add,
          color: Colors.white, // Icon color
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
