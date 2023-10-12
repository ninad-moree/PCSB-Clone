part of 'calendar_bloc.dart';

class CalendarState {
  final DateTime selectedDate;
  final Map<DateTime, List<Event>> events;

  CalendarState({required this.selectedDate, required this.events});

  CalendarState copyWith(
      {DateTime? selectedDate, Map<DateTime, List<Event>>? events}) {
    return CalendarState(
      selectedDate: selectedDate ?? this.selectedDate,
      events: events ?? this.events,
    );
  }
}
