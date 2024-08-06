import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/quote_model.dart';
import '../repositories/quote_repository.dart';
import 'favorite_quotes_screen.dart';
import 'quote_screen.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  /// This widget is the home page of my application
  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;
  Quote showQuote = QuoteRepository().currentQuote;

  void changeQuote() async {
    Quote? gotQuote = await QuoteRepository().getQuote;

    if (kDebugMode) {
      print(gotQuote);
      assert(gotQuote == QuoteRepository().currentQuote, 'Quote not updated');
    }

    setState(() {
      showQuote = gotQuote;
    });
  }

  FloatingActionButton inspireMeButton({required ColorScheme theme}) {
    return FloatingActionButton.extended(
      label: const Text('Inspire me'),
      backgroundColor: theme.tertiaryContainer,
      foregroundColor: theme.onTertiaryContainer,
      onPressed: changeQuote,
      tooltip: 'Refresh',
      icon: const Icon(Icons.auto_awesome_rounded),
    );
  }

  FloatingActionButton? buildFloatingActionButton(
      int selectedTabIndex, ColorScheme theme) {
    return selectedTabIndex == 0 ? inspireMeButton(theme: theme) : null;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // backgroundColor: theme.inversePrimary,
      ),
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
      body: <Widget>[
        QuoteScreen(quote: showQuote),
        const FavoriteQuoteScreen(),
      ][selectedTabIndex],
      floatingActionButton: buildFloatingActionButton(selectedTabIndex, theme),
    );
  }
}
