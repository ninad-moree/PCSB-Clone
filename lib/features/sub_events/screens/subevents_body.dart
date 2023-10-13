import 'package:flutter/material.dart';
import 'package:tp2/features/sub_events/widgets/snaphunt_subevents_widgets.dart';
import 'package:tp2/features/sub_events/widgets/xenia_subevents_widgets.dart';

class SubEventsBody extends StatelessWidget {
  final String eventName;

  const SubEventsBody({
    super.key,
    required this.eventName,
  });

  @override
  Widget build(BuildContext context) {
    if (eventName == "Xenia") {
      return XeniaSubEvents();
    } else if (eventName == "Snaphunt") {
      return const SnapHuntSubEvents();
    } else {
      return const Center(
        child: Text("Page not yet built"),
      );
    }
  }
}
