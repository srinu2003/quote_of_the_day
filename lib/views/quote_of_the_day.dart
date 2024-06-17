import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteOfTheDay extends StatefulWidget {
  final String title;

  const QuoteOfTheDay({super.key, required this.title});

  // This widget is the home page of my application

  @override
  State<QuoteOfTheDay> createState() => _QuoteOfTheDayState();
}

class _QuoteOfTheDayState extends State<QuoteOfTheDay> {
  int selectedTabIndex = 0;
  bool? saveSelected = false;

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

  Widget buildQuoteOfTheDay() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card.filled(
            margin:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'The greatest glory in living lies not in never falling, but in rising every time we fall.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: GoogleFonts.jetBrainsMono(
                        fontWeight: FontWeight.bold,
                      ).fontFamily,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    '\n- Nelson Mandela',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined),
                      label: const Text('Share'),
                    ),
                    IconButton(
                      tooltip: 'Save to Bookmarks',
                      isSelected: saveSelected,
                      onPressed: () {
                        setState(() {
                          saveSelected = !saveSelected!;
                        });
                      },
                      icon: const Icon(Icons.bookmark_border_rounded),
                      selectedIcon: const Icon(Icons.bookmark_outlined),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBookmarksPage() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Card.outlined(
            child: ListTile(
              title: Text('Quote 1'),
              subtitle: Text('This is a saved quote'),
            ),
          ),
          Divider(),
          Card.outlined(
            child: ListTile(
              title: Text('Quote 2'),
              subtitle: Text('This is a saved quote'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: buildAppBar(theme),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTabIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedTabIndex = index;
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
      floatingActionButton: buildFloatingActionButton(theme),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: <Widget>[
        buildQuoteOfTheDay(),
        buildBookmarksPage(),
      ][selectedTabIndex],
    );
  }
}
