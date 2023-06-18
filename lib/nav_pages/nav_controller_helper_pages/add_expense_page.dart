import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: const Text(
          'Add Expense',
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              (Icons.check),
              color: Colors.black,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1.0,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ))),
          ),
        ),
      ),
      body: Column(
        children: [
          const Row(children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            Text(
              'With You and: ',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
                child: TextField(
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter name, email, or phone#"),
            ))
          ]),
          Container(
            height: 1.0,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ))),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.receipt),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter description',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.attach_money),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '0.00',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                const Text(
                  'Paid by ',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  width: 2,
                ),
                GestureDetector(
                    onTap: () {
                      // Perform action when 'You' is tapped
                    },
                    child: Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: const Center(
                          child: Text(
                            'You',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ))),
                const Text(' and splits', style: TextStyle(fontSize: 16)),
                const SizedBox(
                  width: 2,
                ),
                GestureDetector(
                    onTap: () {
                      // Perform action when 'You' is tapped
                    },
                    child: Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: const Center(
                          child: Text(
                            'equally',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
