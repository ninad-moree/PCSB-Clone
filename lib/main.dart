import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp2/bloc/bloc/calendar_bloc.dart';

import 'screens/homepage_screen.dart';

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
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
