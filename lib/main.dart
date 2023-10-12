import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp2/features/home/screens/home_screen.dart';
import 'features/calendar/bloc/calendar/calendar_bloc.dart';

void main() {
  runApp(
    BlocProvider<CalendarBloc>(
      create: (context) => CalendarBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
