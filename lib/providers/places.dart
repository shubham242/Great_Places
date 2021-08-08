import 'dart:io';

import 'package:flutter/material.dart';

import '../models/place.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => _items;

  void appPlace(String title, File image) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: image,
      location: null,
      title: title,
    );
    _items.add((newPlace));
    notifyListeners();
  }
}
