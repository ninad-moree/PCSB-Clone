import 'package:flutter/material.dart';
import 'package:tp2/data/events_data.dart';
import 'package:tp2/features/sub_events/screens/subevents.dart';

import 'animated_event_card_widget.dart';

class EventCarousel extends StatefulWidget {
  final int defaultIndex;
  final ValueChanged<int> onIndexChanged;

  const EventCarousel({
    Key? key,
    required this.defaultIndex,
    required this.onIndexChanged,
  }) : super(key: key);

  @override
  State<EventCarousel> createState() => _EventCarouselState();
}

class _EventCarouselState extends State<EventCarousel> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      keepPage: false,
      viewportFraction: 0.7,
    );
    _pageController = PageController(initialPage: widget.defaultIndex);
  }

  void _navigateToDetailScreen(int index) {
    final eventName = EventData.eventData[index]['eventName'];
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SubEvents(eventName: eventName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 350,
      color: Colors.transparent,
      child: PageView.builder(
        itemCount: EventData.eventData.length,
        controller: _pageController, // Use the _pageController here
        onPageChanged: widget.onIndexChanged,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _navigateToDetailScreen(index);
            },
            child: AnimatedEventCard(
              pageController: _pageController, // Pass _pageController
              index: index,
            ),
          );
        },
        pageSnapping: true,
      ),
    );
  }
}
