import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_of_the_day/widgets/bookmark_icon.dart';

class QuoteCard extends StatefulWidget {
  final String quote;
  final String author;

  const QuoteCard({
    super.key,
    required this.quote,
    required this.author,
  });

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  bool? saveSelected = false;

  String get author => widget.author;
  String get quote => widget.quote;

  void _addBookmark() {
    setState(() {
      saveSelected = !saveSelected!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Card>[
        Card.filled(
          margin:
              const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0 + 56.0 + 16.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  quote,
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
                  '\n- $author',
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
                  BookmarkIcon(
                    onPressed: _addBookmark,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
