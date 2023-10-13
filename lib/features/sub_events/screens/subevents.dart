import 'package:flutter/material.dart';
import 'package:tp2/constants/app_color.dart';
import 'package:tp2/features/sub_events/screens/subevents_body.dart';

class SubEvents extends StatelessWidget {
  final String eventName;
  const SubEvents({
    super.key,
    required this.eventName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.vulcan,
        title: Text(eventName),
      ),
      body: SubEventsBody(
        eventName: eventName,
      ),
    );
  }
}
