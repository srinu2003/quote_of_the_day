import 'package:flutter/material.dart';

import 'package:quote_of_the_day/widgets/home_screen.dart';

/// Flutter code sample for [Quote_of_the_day].

void main() {
  runApp(const QuotesApp());
}

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});
  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote of the Day App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of my application.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true),
      home: const QuoteOfTheDay(title: 'Quote of the Day'),
    );
  }
}
