import 'package:flutter/material.dart';
import 'package:tp2/features/events/widgets/event_card_widget.dart';

import '../../../data/events_data.dart';

class AnimatedEventCard extends StatelessWidget {
  final PageController pageController;
  final int index;

  const AnimatedEventCard({
    Key? key,
    required this.pageController,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> eventData =
        EventData.eventData[index]; // Access the event data
    final AssetImage assetImage = eventData['poster'];

    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page! - index;
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: (Curves.easeIn.transform(value.clamp(0.0, 1.0)) * 350)
                  .toDouble(),
              width: 300,
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              height:
                  Curves.easeIn.transform(index == 0 ? value : value * 1) * 350,
              width: 300,
              child: child,
            ),
          );
        }
      },
      child: EventCardWidget(
        assetImage: assetImage,
      ),
    );
  }
}
