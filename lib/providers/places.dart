import 'dart:io';

import 'package:flutter/material.dart';

import '../models/place.dart';
import '../models/db_helper.dart';
import '../models/location_helper.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => _items;

  Place findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void addPlace(
    String title,
    File image,
    PLocation pickedLocation,
  ) async {
    final address = await LocationHelper.getPlaceAddress(
      pickedLocation.latitude,
      pickedLocation.longitude,
    );
    final fLocation = PLocation(
      latitude: pickedLocation.latitude,
      longitude: pickedLocation.longitude,
      address: address,
    );
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: image,
      location: fLocation,
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
        'loc_lat': newPlace.location.latitude,
        'loc_lng': newPlace.location.longitude,
        'address': newPlace.location.address,
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
            location: PLocation(
              latitude: item['loc_lat'],
              longitude: item['loc_lng'],
              address: item['address'],
            ),
          ),
        )
        .toList();
    notifyListeners();
  }
}
