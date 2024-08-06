import 'package:flutter/material.dart';

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Divider(),
        Card.outlined(
          child: ListTile(
            title: Text('Quote 1'),
            subtitle: Text('This is a saved quote'),
          ),
        ),
      ],
    );
  }
}
