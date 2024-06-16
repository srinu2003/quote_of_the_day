import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:quote_of_the_day/widgets/navigation_bar.dart';

class QuoteOfTheDay extends StatefulWidget {
  const QuoteOfTheDay({super.key, required this.title});

  // This widget is the home page of my application

  final String title;

  @override
  State<QuoteOfTheDay> createState() => _QuoteOfTheDayState();
}

class _QuoteOfTheDayState extends State<QuoteOfTheDay> {
  int selectedTabIndex = 0;
  bool? saveSelected = false;
  // ignore: unused_field
  final bool _enableFAB = false;

  // ignore: unused_element
  void _changeQuote() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values.

      // Change the Quote here
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final ColorScheme theme = Theme.of(context).colorScheme;

    // ignore: unused_local_variable
    final List<String> savedQuotes = <String>[
      'Quote 1',
      'Quote 2',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: theme.inversePrimary,
      ),
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
      floatingActionButton: selectedTabIndex == 0
          ? FloatingActionButton.extended(
              label: const Text('Inspire me'), // for Extended FAB
              backgroundColor: theme.tertiaryContainer,
              foregroundColor: theme.onTertiaryContainer,
              onPressed: _changeQuote,
              tooltip: 'Refresh',
              icon: const Icon(Icons.auto_awesome_rounded), // for Extended FAB
              // child: const Icon(Icons.refresh_rounded),
            )
          : null,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: <Widget>[
        /// Quote of the day Home Page

        Center(
          // Center is a layout widget. It takes a single child and positions it in the middle of the parent.

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card.filled(
                // DOUBT: What does margin do?
                // DOUBT: What does EdgeInsetGeometry: const EdgeInsets.all(10.0), do?
                margin: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      // No leading widget, so the title is centered.
                      // leading: Icon(Icons.album),
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
                            fontStyle: FontStyle.italic),
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
                        IconButton.filledTonal(
                          tooltip: 'Bookmark',
                          isSelected: saveSelected,
                          onPressed: () {
                            setState(
                              () {
                                saveSelected = !saveSelected!;
                              },
                            );
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
        ),

        /** Bookmarks Page
         * This page will show the list of saved quotes.
         * The user can delete the quotes from the list.
        */
        const Padding(
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
        ),
      ][selectedTabIndex],
    );
  }
}
