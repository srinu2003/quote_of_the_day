import 'package:flutter/material.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
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
}