import 'package:flutter/material.dart';

import '../models/place.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => _items;
}
