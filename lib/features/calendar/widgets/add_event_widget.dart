import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp2/constants/app_color.dart';
import '../bloc/calendar/calendar_bloc.dart';

class AddEventBottomSheet extends StatefulWidget {
  const AddEventBottomSheet({super.key});

  @override
  State<AddEventBottomSheet> createState() => _AddEventBottomSheetState();
}

class _AddEventBottomSheetState extends State<AddEventBottomSheet> {
  final TextEditingController _eventTitleController = TextEditingController();
  final TextEditingController _eventDescriptionController =
      TextEditingController();

  @override
  void dispose() {
    _eventTitleController.dispose();
    _eventDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalendarBloc>(
      create: (context) => CalendarBloc(),
      child: Container(
        color: const Color.fromARGB(255, 9, 5, 41),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Add Event',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                autofocus: true,
                controller: _eventTitleController,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Event Title',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.royalBlue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.royalBlue,
                    ),
                  ),
                ),
              ),
            ),
            TextField(
              autofocus: true,
              controller: _eventDescriptionController,
              minLines: 3,
              maxLines: 5,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Event Description',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.royalBlue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.royalBlue,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: AppColor.royalBlue,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.royalBlue,
                  ),
                  onPressed: () {
                    final eventTitle = _eventTitleController.text;
                    final eventDescription = _eventDescriptionController.text;
                    if (eventTitle.isNotEmpty && eventDescription.isNotEmpty) {
                      final selectedDate =
                          BlocProvider.of<CalendarBloc>(context)
                              .state
                              .selectedDate;
                      BlocProvider.of<CalendarBloc>(context).add(
                        AddEventEvent(
                            selectedDate, eventTitle, eventDescription),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Add Event'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
