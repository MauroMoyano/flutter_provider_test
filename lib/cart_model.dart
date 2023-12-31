import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<String> _items = [];

  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }

  void removeLastItem() {
    if(_items.isNotEmpty) {
      items.removeLast();
      notifyListeners();
    }
  }

}