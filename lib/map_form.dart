import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  _MapPageState createState() => _MapPageState();
}


class _MapPageState extends State<MapPage> {
  final _formkey =GlobalKey<FormState>();
  Completer<GoogleMapController> _controller = Completer();


  static const CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(-0.258889, -79.203565),
      zoom: 14.4746,
    );
    
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mapa", style: TextStyle(color: Colors.amberAccent),),
        backgroundColor: Color.fromARGB(255, 128, 125, 125),
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed:() => {}, icon: Icon(Icons.search)),
          IconButton(onPressed:() => {}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: Stack(
          key: _formkey,
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
                )
              )
            ],
          ), 
    ); 
  }
}
