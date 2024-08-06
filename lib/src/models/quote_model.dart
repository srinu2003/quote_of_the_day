class Quote {
  // required fields
  final String text;
  final String author;

  // optional fields
  bool isFavorite = false;

  // constructor
  Quote({
    required this.text,
    required this.author,
  });

  // factory constructor
  // for creating a new Quote object from json
  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      text: json['text'] ?? '',
      author: json['author'] ?? 'Anonymous',
    )..isFavorite = json['isFavorite'] ?? false;
  }

  // method to convert object to json
  // this is useful when saving to local storage and when sending data to server
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'text': text,
      'author': author,
      'isFavorite': isFavorite,
    };
  }

  // method to convert list of json to list of Quote objects
  static List<Quote> fromJsonList({required List<dynamic> jsonList}) {
    return List<Quote>.from(jsonList.map((dynamic item) {
      return Quote.fromJson(item);
    }));
  }

  // method to convert list of Quote objects to list of json
  static List<Map<String, dynamic>> toJsonList({required List<Quote> quotes}) {
    return List<Map<String, dynamic>>.from(quotes.map((Quote item) {
      return item.toJson();
    }));
  }

  // method to convert list of json to list of Quote objects
  static Future<List<Quote>> fromJsonListFuture(
      {required List<dynamic> jsonList}) async {
    return List<Quote>.from(jsonList.map((dynamic item) {
      return Quote.fromJson(item);
    }));
  }

  // method to toggle favorite status
  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  // for creating a new Quote object from map
  factory Quote.fromMap(Map<String, dynamic> map) => Quote.fromJson(map);

  // method to convert object to map
  Map<String, dynamic> toMap() => toJson();

  // Implements `==` operator
  @override
  bool operator ==(Object other) {
    return other is Quote && other.hashCode == hashCode;
  }

  // Implements `hashCode` property
  @override
  int get hashCode => Object.hash(text, author);
  @override
  String toString() {
    return '''
Quote{ 
  id: $hashCode,
  text: $text, 
  author: $author, 
  isFavorite: $isFavorite,
}''';
  }
}
