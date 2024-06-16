import 'package:flutter/material.dart';
import 'package:quote_of_the_day/views/quote_of_the_day.dart';

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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
          useMaterial3: true),
      home: const QuoteOfTheDay(title: 'Quote of the Day'),
    );
  }
}
