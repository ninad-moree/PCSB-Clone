import 'package:flutter/material.dart';
import 'package:tp2/features/events/widgets/event_carousel_widget.dart';

import '../../../data/events_data.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({
    super.key,
  });

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final List<Map<String, dynamic>> eventData = EventData.eventData;
  int currentEventIndex = 0;

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            AppBar(),
            SizedBox(height: 40),
            EventCarousel(defaultIndex: 1),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 35,
          ),
        ),
        const Text(
          "EVENTS",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 35,
          ),
        ),
      ],
    );
  }
}
