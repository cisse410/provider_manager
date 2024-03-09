import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider_manager/model/items.dart';

class ItemData with ChangeNotifier {
  final List<Item> _items = [];
  UnmodifiableListView get items => UnmodifiableListView(_items);
  // la taille de la liste
  get size => _items.length;

  // Add an item to the list

  void addItem(Item item) {
    _items.add(item);
    print("Element : ${_items[0].itemName}");
    notifyListeners();
  }

  // Remove an item to the list

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }

  // Display an item

  void displayItem(Item item) {
    item.afficher();
    notifyListeners();
  }
}
