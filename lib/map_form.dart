import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'menu_comp.dart';


class MapPage extends StatefulWidget {
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _formkey = GlobalKey<FormState>();
  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(-0.258889, -79.203565),
    zoom: 14.4746,
  );

  static const CameraPosition _position = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(-0.258889, -79.203565),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formkey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Localización", style: TextStyle(color: Colors.amberAccent),),
        backgroundColor: Color.fromARGB(255, 128, 125, 125),  
      ),
      drawer: MenuCompDrawer(),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            top: 50.0,
            left: 10.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _company,
        label: const Text('Ubicanos'),
        icon: const Icon(Icons.business),
      ),
    );
  }

  Future<void> _company() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_position));
  }
}
