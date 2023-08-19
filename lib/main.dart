import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp2/bloc/bloc/calendar_bloc.dart';

import 'widgets/add_event_widget.dart';
import 'widgets/calender_widget.dart';
import 'widgets/event_list_widget.dart';

void main() {
  runApp(
    BlocProvider<CalendarBloc>(
      create: (context) => CalendarBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showAddEventBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const AddEventBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
