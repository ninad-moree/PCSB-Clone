import 'dart:ui';

import 'package:flutter/material.dart';

class EventBackdrop extends StatelessWidget {
  final List<Map<String, dynamic>> eventData;
  final int currentIndex;
  const EventBackdrop({
    super.key,
    required this.eventData,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final AssetImage assetImage = eventData[currentIndex]['poster'];

    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      heightFactor: 0.4,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
        child: Stack(
          children: [
            FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
              child: Image(
                image: assetImage,
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                width: 100,
                height: 400,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
