import 'package:flutter/material.dart';
import 'package:great_places/screens/add_place.dart';
import 'package:provider/provider.dart';

import './models/custom_colors.dart';
import './providers/places.dart';
import './screens/places_list.dart';
import './screens/add_place.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Places(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: CustomColors.primaryColor,
          accentColor: CustomColors.accentColor,
          canvasColor: CustomColors.canvasColor,
        ),
        home: PlacesList(),
        routes: {
          AddPlace.routeName: (ctx) => AddPlace(),
        },
      ),
    );
  }
}
