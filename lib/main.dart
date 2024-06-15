import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

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
      title: 'Quote of the Day',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of my application.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true),
      home: const QuoteOfTheDay(),
    );
  }
}

class QuoteOfTheDay extends StatefulWidget {
  const QuoteOfTheDay({super.key});

  @override
  State<QuoteOfTheDay> createState() => _QuoteOfTheDayState();
}

class _QuoteOfTheDayState extends State<QuoteOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}