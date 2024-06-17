import 'package:flutter/material.dart';
import 'package:quote_of_the_day/views/bookmarks_screen.dart';
import 'package:quote_of_the_day/views/quote_screen.dart';

class QuoteOfTheDay extends StatefulWidget {
  final String title;

  const QuoteOfTheDay({super.key, required this.title});

  // This widget is the home page of my application

  @override
  State<QuoteOfTheDay> createState() => _QuoteOfTheDayState();
}

class _QuoteOfTheDayState extends State<QuoteOfTheDay> {
  int selectedTabIndex = 0;

  void _changeQuote() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values.

      // Change the Quote here
    });
  }

  PreferredSizeWidget? buildAppBar(ColorScheme theme) {
    return AppBar(
      title: Text(widget.title),
      backgroundColor: theme.inversePrimary,
    );
  }

  Widget? buildFloatingActionButton(ColorScheme theme) {
    return selectedTabIndex == 0
        ? FloatingActionButton.extended(
            label: const Text('Inspire me'),
            backgroundColor: theme.tertiaryContainer,
            foregroundColor: theme.onTertiaryContainer,
            onPressed: _changeQuote,
            tooltip: 'Refresh',
            icon: const Icon(Icons.auto_awesome_rounded),
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: buildAppBar(theme),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
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
        selectedIndex: selectedTabIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedTabIndex = index;
          });
        },
      ),
      floatingActionButton: buildFloatingActionButton(theme),
      body: <Widget>[
        const QuoteCard(
          quote:
              'The greatest glory in living lies not in never falling, but in rising every time we fall.',
          author: 'Nelson Mandela',
        ),
        const BookmarksPage(),
      ][selectedTabIndex],
    );
  }
}
