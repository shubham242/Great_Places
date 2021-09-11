import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/place.dart';

class Maps extends StatefulWidget {
  final PLocation initLoc;
  final bool isSelect;

  Maps({
    this.initLoc,
    this.isSelect,
  });

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  LatLng _pickedLocation;
  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pickedLocation = LatLng(widget.initLoc.latitude, widget.initLoc.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        centerTitle: true,
        actions: [
          if (widget.isSelect)
            IconButton(
              icon: Icon(Icons.check),
              onPressed: _pickedLocation == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickedLocation);
                    },
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initLoc.latitude,
            widget.initLoc.longitude,
          ),
          zoom: 16,
        ),
        onTap: widget.isSelect ? _selectLocation : null,
        markers: {
          Marker(
            markerId: MarkerId('m1'),
            position: _pickedLocation ??
                LatLng(widget.initLoc.latitude, widget.initLoc.longitude),
          ),
        },
      ),
    );
  }
}
