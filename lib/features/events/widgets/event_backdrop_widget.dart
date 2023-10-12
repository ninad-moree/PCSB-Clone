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

    return SizedBox(
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
        child: Stack(
          children: [
            Image(
              image: assetImage,
              fit: BoxFit.cover,
              height: 440,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                width: 400,
                height: 800,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
