import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  final List<String> _products = [];

  List<String> get products => _products;

  void addItem(String product) {
    _products.add(product);
    notifyListeners();
  }
}