import 'dart:io';

import 'package:flutter/material.dart';

import '../models/place.dart';
import '../models/db_helper.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => _items;

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: image,
      location: null,
      title: title,
    );
    _items.add((newPlace));
    notifyListeners();
    DBHelper.insert(
      'user_places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
      },
    );
  }

  Future<void> fetchPlaces() async {
    final dalaList = await DBHelper.getData('user_places');
    _items = dalaList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: null,
          ),
        )
        .toList();
    notifyListeners();
  }
}
