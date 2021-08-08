import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/places.dart';
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
        body: Consumer<Places>(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Places Yet!',
                  textScaleFactor: 1.5,
                ),
                RaisedButton(
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    Navigator.of(context).pushNamed(AddPlace.routeName);
                  },
                  child: Text('Add Places'),
                ),
              ],
            ),
          ),
          builder: (ctx, places, ch) => places.items.length <= 0
              ? ch
              : ListView.builder(
                  itemCount: places.items.length,
                  itemBuilder: (ctx, i) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(places.items[i].image),
                    ),
                    title: Text(places.items[i].title),
                  ),
                ),
        ));
  }
}
