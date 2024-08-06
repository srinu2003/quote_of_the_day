import 'package:flutter/material.dart';

import '../models/quote_model.dart';
import '../repositories/quote_repository.dart';

class FavoriteQuoteScreen extends StatefulWidget {
  const FavoriteQuoteScreen({super.key});

  @override
  State<FavoriteQuoteScreen> createState() => _FavoriteQuoteScreenState();
}

class _FavoriteQuoteScreenState extends State<FavoriteQuoteScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Quote>>(
      stream: Stream.fromIterable([
        QuoteRepository.favoriteQuotesList
      ]), // Replace quoteStream with your actual stream
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final quotes = snapshot.data;
          return ListView.builder(
            itemCount: quotes?.length,
            itemBuilder: (context, index) {
              final quote = quotes?[index];
              return Column(
                children: [
                  const Divider(),
                  Card.outlined(
                    child: ListTile(
                      title: Text(quote!.text),
                      subtitle: Text(quote.author),
                      trailing: IconButton(
                        onPressed: () {
                          // Implement delete functionality here
                        },
                        icon: const Icon(Icons.delete_forever_rounded),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
