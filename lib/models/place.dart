import 'dart:io';

import 'package:flutter/material.dart';

class PLocation {
  final double latitude;
  final double longitude;
  final String address;

  const PLocation({
    @required this.latitude,
    @required this.longitude,
    this.address,
  });
}

class Place {
  final String id;
  final String title;
  final PLocation location;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
