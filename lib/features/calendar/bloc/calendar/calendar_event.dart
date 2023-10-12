part of 'calendar_bloc.dart';

abstract class CalendarEvent {}

class SelectDateEvent extends CalendarEvent {
  final DateTime date;
  SelectDateEvent(this.date);
}

class AddEventEvent extends CalendarEvent {
  final DateTime date;
  final String title;
  final String description;
  AddEventEvent(this.date, this.title, this.description);
}
