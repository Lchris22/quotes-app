import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteModel with ChangeNotifier {
  final List<Quote> _quotes = <Quote>[];
  List<Quote> get quotes => _quotes.toList();

  void add(Quote value) {
    _quotes.add(value);
    notifyListeners();
  }

  void remove(int value) {
    _quotes.removeAt(value);
    notifyListeners();
  }
}
