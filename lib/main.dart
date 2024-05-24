import 'package:algorithms/constants.dart';
import 'package:algorithms/sorting_details.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorithms',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: primary,
          primaryColorDark: primaryDark,
          canvasColor: Colors.transparent),
      home: const SortDetailsScreen(),
    );
  }
}
