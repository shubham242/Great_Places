import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/places.dart';
import '../screens/add_place.dart';
import '../screens/maps_screen.dart';

class PlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Places',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddPlace.routeName);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: FutureBuilder(
        future: Provider.of<Places>(context, listen: false).fetchPlaces(),
        builder: (ctx, ss) => ss.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<Places>(
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
                        itemBuilder: (ctx, i) => Card(
                          margin: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          elevation: 4,
                          child: ListTile(
                            isThreeLine: true,
                            contentPadding: EdgeInsets.all(10),
                            title: Text(
                              places.items[i].title,
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(places.items[i].location.address),
                            trailing: GestureDetector(
                              child: CircleAvatar(
                                radius: 28,
                                backgroundImage:
                                    FileImage(places.items[i].image),
                              ),
                              onTap: () => showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  contentPadding: EdgeInsets.all(0),
                                  content: Image.file(
                                    places.items[i].image,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => Maps(
                                    initLoc: places.items[i].location,
                                    isSelect: false,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
              ),
      ),
    );
  }
}
