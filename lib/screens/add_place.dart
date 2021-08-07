import 'package:flutter/material.dart';

import '../widgets/image_input.dart';

class AddPlace extends StatefulWidget {
  static const routeName = '/add-place';
  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(height: 250, child: ImageInput()),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            label: Text('Add Place'),
            icon: Icon(Icons.add),
            onPressed: () {},
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }
}
