import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../bloc/bloc/calendar_bloc.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  final DateTime _focusedDay = DateTime.now();

  final TextEditingController _eventTitleController = TextEditingController();
  final TextEditingController _eventDescrpController = TextEditingController();
  final FocusNode _eventTitleFocusNode = FocusNode();

  @override
  void dispose() {
    _eventTitleController.dispose();
    _eventDescrpController.dispose();
    _eventTitleFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              TableCalendar(
                focusedDay: _focusedDay,
                firstDay: DateTime(2020),
                lastDay: DateTime(2025),
                calendarFormat: _calendarFormat,
                startingDayOfWeek: StartingDayOfWeek.monday,
                rowHeight: 60,
                daysOfWeekHeight: 50,
                eventLoader: (date) => state.events[date] ?? [],
                calendarBuilders: CalendarBuilders(
                  // dots under days to indicate events
                  markerBuilder: (context, date, events) {
                    if (events.isNotEmpty) {
                      return Positioned(
                        bottom: 5,
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                headerStyle: const HeaderStyle(
                  //name of the month
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  formatButtonVisible: false,
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                  ),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  //mon-tue-...
                  weekdayStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  weekendStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                calendarStyle: CalendarStyle(
                  //dates 1,2,3....
                  outsideTextStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                  defaultTextStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  weekendTextStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  todayDecoration: const ShapeDecoration(
                    color: Color.fromARGB(71, 0, 169, 226),
                    shape: RoundedRectangleBorder(),
                  ),
                  selectedDecoration: ShapeDecoration(
                    color: const Color(0xeb00a9e2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                selectedDayPredicate: (day) {
                  return isSameDay(day, state.selectedDate);
                },
                onDaySelected: (selectedDate, _) {
                  BlocProvider.of<CalendarBloc>(context)
                      .add(SelectDateEvent(selectedDate));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}