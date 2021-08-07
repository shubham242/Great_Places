import 'package:flutter/material.dart';

import '../screens/add_place.dart';

class PlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlace.routeName);
            },
          )
        ],
      ),
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}
