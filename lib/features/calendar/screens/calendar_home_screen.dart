import 'package:flutter/material.dart';
import 'package:tp2/constants/app_color.dart';

import '../widgets/add_event_widget.dart';
import '../widgets/calender_widget.dart';
import '../widgets/event_list_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _HomePageState();
}

class _HomePageState extends State<CalendarScreen> {
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
        backgroundColor: AppColor.vulcan,
        actions: [
          IconButton(
            onPressed: () {
              _showAddEventBottomSheet();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: AppColor.vulcan,
      body: const Column(
        children: [
          CalendarWidget(),
          EventListWidget(),
        ],
      ),
    );
  }
}
