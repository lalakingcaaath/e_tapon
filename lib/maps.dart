import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maps"),
      ),
      body: Stack(
        children: const <Widget>[
          GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(14.599572184290048, 121.00432505420763),
                  zoom: 17
              ),
          ),
        ],
      ),
    );
  }
}