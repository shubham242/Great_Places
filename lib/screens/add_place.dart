import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/places.dart';
import '../widgets/image_input.dart';
import '../widgets/location_input.dart';

class AddPlace extends StatefulWidget {
  static const routeName = '/add-place';
  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace(BuildContext ctx) {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      Scaffold.of(ctx).hideCurrentSnackBar();
      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(
            _titleController.text.isEmpty && _pickedImage == null
                ? 'Title and Image not Provided!'
                : _pickedImage == null
                    ? 'Image not Provided!'
                    : 'Title not Provided!',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    Provider.of<Places>(context, listen: false).addPlace(
      _titleController.text,
      _pickedImage,
    );
    Navigator.of(context).pop();
  }

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
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      child: ImageInput(_selectImage),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    SizedBox(height: 20),
                    LocationInput(),
                  ],
                ),
              ),
            ),
          ),
          Builder(
            builder: (BuildContext ctx) => RaisedButton.icon(
              label: Text('Add Place'),
              icon: Icon(Icons.add),
              onPressed: () => _savePlace(ctx),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
