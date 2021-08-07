import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _image;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _image != null
              ? Image.file(
                  _image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('No Image'),
        ),
        Container(
          child: FlatButton.icon(
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(5),
            icon: Icon(
              Icons.camera,
              color: Theme.of(context).primaryColor,
            ),
            label: Text(
              'Take Picture',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            onPressed: _takePicture,
          ),
        )
      ],
    );
  }
}
