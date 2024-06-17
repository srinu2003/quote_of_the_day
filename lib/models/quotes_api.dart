import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class Quote {
  final String text;
  final String author;

  Quote(this.text, this.author);
}

Future<Quote> fetchRandomQuote() async {
  final response = await http.get(Uri.parse('https://type.fit/api/quotes'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    final randomIndex = Random().nextInt(data.length);
    final quoteData = data[randomIndex];
    final String text = quoteData['text'];
    final String author = quoteData['author'] ?? 'Unknown';
    return Quote(text, author);
  } else {
    throw Exception('Failed to fetch random quote');
  }
}

// void main() async {
//   try {
//     Quote randomQuote = await fetchRandomQuote();
//     print('Random Quote: ${randomQuote.text} - ${randomQuote.author}');
//   } catch (e) {
//     print('Error: $e');
//   }
// }

// List<Quote> quotes = [
//   Quote("The greatest glory in living lies not in never falling, but in rising every time we fall.", "Nelson Mandela"),
//   Quote("The way to get started is to quit talking and begin doing.", "Walt Disney"),
//   Quote("Your time is limited, don't waste it living someone else's life.", "Steve Jobs"),
//   Quote("If life were predictable it would cease to be life, and be without flavor.", "Eleanor Roosevelt"),
// ];