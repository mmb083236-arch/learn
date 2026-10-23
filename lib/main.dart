import 'package:flutter/material.dart';
import 'package:learn/feat/to_do_list/ui/screen/to_do_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          labelLarge: TextStyle(fontSize: 40),
          labelMedium: TextStyle(fontSize: 15),
          labelSmall: TextStyle(fontSize: 10),
        ),
      ),
      home: ToDoListScreen(),
    );
  }
}
