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

  String get title => 'Quote of the Day';

  @override
  State<QuoteOfTheDay> createState() => _QuoteOfTheDayState();
}

class _QuoteOfTheDayState extends State<QuoteOfTheDay> {
  int currentPageIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final ThemeData theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home_rounded),
            icon: Badge(child: Icon(Icons.home_outlined)),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark_rounded),
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.bookmark_border_rounded),
            ),
            label: 'Bookmarks',
          ),
        ],
      ),
    );
  }
}