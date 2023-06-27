import 'package:flutter/material.dart';
import 'package:module_8/task.dart';



main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      home:  TaskListScreen(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.teal,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.greenAccent
          )
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.lightGreen,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.purple
          )
      ),
    );
  }
}