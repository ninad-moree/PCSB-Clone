import 'package:flutter/material.dart';

class EventCardWidget extends StatelessWidget {
  final AssetImage assetImage;

  const EventCardWidget({
    Key? key,
    required this.assetImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 550, // Adjust the height as needed
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: assetImage,
            ),
          ),
        ),
      ),
    );
  }
}
