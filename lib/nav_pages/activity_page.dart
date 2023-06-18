import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  late ScrollController _scrollController;
  bool _isAppBarText = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      final bool isScrollingDown =
          _scrollController.position.userScrollDirection ==
              ScrollDirection.forward;
      setState(() {
        _isAppBarText = isScrollingDown;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          style: TextStyle(
            fontSize: _isAppBarText ? 24 : 20,
            color: Colors.black,
          ),
          child: const Text(
            'Activity',
          ),
        ),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              'Activity Task ${index + 1}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            subtitle: const Text(
              '+123 456 7890',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          );
        },
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
