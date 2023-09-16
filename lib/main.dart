import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp2/bloc/bloc/calendar_bloc.dart';
import 'package:tp2/constants/app_color.dart';

import 'screens/homepage_screen.dart';

// this is start of your application
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColor.royalBlue.withOpacity(0.25),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColor.royalBlue.withOpacity(0.25),
          )),
      home: const HomePage(),
    );
  }
}
