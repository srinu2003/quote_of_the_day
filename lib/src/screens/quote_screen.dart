import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/quote_model.dart';
import '../repositories/quote_repository.dart';
import '../components/bookmark_filled_icon_button.dart';

class QuoteScreen extends StatefulWidget {
  final Quote quote;

  /// This widget displays a quote
  const QuoteScreen({super.key, required this.quote});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  // bool? saveSelected = false;
  Quote get showQuote => widget.quote;

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
                  showQuote.text,
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
                  '\n- ${showQuote.author}',
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

  void _addBookmark() {
    setState(() {
      QuoteRepository().updateBookmarkList(showQuote);
    });
  }
}
