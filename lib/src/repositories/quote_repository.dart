import '../models/quote_model.dart';
import '../services/api_service.dart';
import '../utils/constants.dart';

class QuoteRepository {
  final QuoteApiClient _apiClient = QuoteApiClient();

  static List<Quote> _quotesList = [];
  static List<Quote> favoriteQuotesList = [];
  int _currentIndex = 0;
  Quote currentQuote = Constants.defaultQuote;

  // Singleton factory
  static final QuoteRepository _instance = QuoteRepository._internal();

  factory QuoteRepository() {
    return _instance;
  }

  QuoteRepository._internal();

  Future<Quote> get getQuote async {
    if (_quotesList.isEmpty || _quotesList.length == 1) {
      try {
        _quotesList = (await _apiClient.fetchQuotesList(
          apiUrl: Constants.apiUrl,
        )); // Casting not needed in Dart 2.12
      } catch (e) {
        // Handle the exception here, e.g. log the error or show a friendly message to the user
        _quotesList = [
          Quote(text: 'Unexpected error: ${e.runtimeType}', author: 'Quote API')
        ];
      }

      if (_quotesList.length == 1) {
        currentQuote = _quotesList[0];
      } else {
        currentQuote = Constants.defaultQuote;
      }
      return currentQuote;
    }

    if (_currentIndex == _quotesList.length - 1) {
      _quotesList = await _apiClient.fetchQuotesList(apiUrl: Constants.apiUrl);
      _currentIndex = 0;
    }

    currentQuote = _quotesList[_currentIndex++];
    return currentQuote;
  }

  List<Quote> get quotesList => _quotesList;

  Future<List<Quote>> getFavoriteQuotes() async {
    // TODO: Implement getchFavoriteQuotes
    return [];
  }

  Future<void> deleteFavoriteQuote(Quote quote) async {
    // TODO: Implement deleteFavoriteQuote
  }

  Future<void> saveFavoriteQuote(Quote quote) async {
    // TODO: Implement saveFavoriteQuote
  }

  Stream<Quote> generateQuotes(int count) async* {
    for (int i = 0; i < count; i++) {
      yield await getQuote;
    }
  }

  Stream<Quote> getFavoriteQuotesStream() async* {
    for (Quote quote in favoriteQuotesList) {
      yield quote;
    }
  }

  void updateBookmarkList(Quote quote) {
    currentQuote.toggleFavorite();
    (currentQuote.isFavorite)
        ? favoriteQuotesList.contains(currentQuote)
            ? null
            : favoriteQuotesList.add(currentQuote)
        : favoriteQuotesList.removeWhere((element) => element == currentQuote);
  }
}
