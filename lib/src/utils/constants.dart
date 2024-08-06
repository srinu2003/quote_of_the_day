import '../models/quote_model.dart';

class Constants {
  static const String apiUrl = 'https://type.fit/api/quotes';

  static final Quote defaultQuote =
      Quote(text: "Welcome to Quote of the Day", author: "Srinivas Rao T");

  static final Quote formatExceptionQuote = Quote(
    text: 'Unexpected error: FormatException',
    author: 'Quote API',
  );

  static final Quote networkErrorQuote = Quote(
      text:
          "Network error: Failed host lookup: 'type.fit'\n Try connecting to Network!",
      author: "Quote API");

  static final Quote socketExceptionQuote = Quote(
    text: 'Unexpected error: SocketException',
    author: 'Quote API',
  );
}
