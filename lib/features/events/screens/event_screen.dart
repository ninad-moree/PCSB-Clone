import 'package:flutter/material.dart';
import 'package:tp2/features/events/widgets/event_backdrop_widget.dart';
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          EventBackdrop(eventData: eventData, currentIndex: currentEventIndex),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const AppBarWidget(),
                const SizedBox(height: 40),
                EventCarousel(
                  defaultIndex: 1,
                  onIndexChanged: (index) {
                    setState(() {
                      currentEventIndex = index; // Update the currentIndex
                    });
                  },
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    eventData[currentEventIndex]['eventName'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    eventData[currentEventIndex]['description'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
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
