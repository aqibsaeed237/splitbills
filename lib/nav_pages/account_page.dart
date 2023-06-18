import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            height: 1.0,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 14,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Account",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )),
            ),
            const SizedBox(
              height: 6,
            ),
            ListTile(
                title: const Text(
                  'Full Name',
                ),
                leading: CircleAvatar(
                  //  backgroundImage: const AssetImage('assets/avatar.png'),
                  // Replace with your own avatar image
                  radius: 30,
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: () {
                      // Handle picking image
                    },
                  ),
                ),
                subtitle: const Text('aqibsaeedmahr@gmail.com'),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 1.0,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.qr_code_scanner_outlined),
              title: Text('Scan Code'),
            ),
            const ListTile(
              leading: Icon(Icons.star),
              title: Text('SplitWise Pro'),
            ),
            ListTile(title: const Text('Prefernce')),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text('Email Setting'),
            ),
            const ListTile(
              leading: Icon(Icons.notification_add_outlined),
              title: Text('Push Notification Setting'),
            ),
            const ListTile(
              leading: Icon(Icons.lock),
              title: Text('PassCode'),
            ),
            ListTile(title: const Text('Feedback')),
            const ListTile(
              leading: Icon(Icons.star),
              title: Text('Rate SplitWise'),
            ),
            const ListTile(
              leading: Icon(Icons.support),
              title: Text('Contact SplitWise Pro'),
            ),
            Container(
              height: 1.0,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.teal,
              ),
              title: Text(
                'Log Out',
                style: TextStyle(color: Colors.teal),
              ),
            )
          ],
        ),
      ),
    );
  }
}
