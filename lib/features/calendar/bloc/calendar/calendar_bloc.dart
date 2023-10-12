import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/event_model.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc()
      : super(CalendarState(selectedDate: DateTime.now(), events: {}));

  @override
  Stream<CalendarState> mapEventToState(CalendarEvent event) async* {
    if (event is SelectDateEvent) {
      yield state.copyWith(selectedDate: event.date);
    } else if (event is AddEventEvent) {
      final updatedEvents = Map<DateTime, List<Event>>.from(state.events);
      updatedEvents[event.date] = updatedEvents[event.date] ?? [];
      updatedEvents[event.date]!
          .add(Event(title: event.title, description: event.description));
      yield state.copyWith(events: updatedEvents);
    }
  }
}
