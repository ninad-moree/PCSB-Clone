import 'package:flutter/material.dart';

import '../widgets/add_event_widget.dart';
import '../widgets/calender_widget.dart';
import '../widgets/event_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showAddEventBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const AddEventBottomSheet(),
        ),
      ),
      // builder: (context) {
      //   return const AddEventBottomSheet();
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Calendar Events'),
        actions: [
          IconButton(
            onPressed: () {
              _showAddEventBottomSheet();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const Column(
        children: [
          CalendarWidget(),
          EventListWidget(),
        ],
      ),
    );
  }
}
