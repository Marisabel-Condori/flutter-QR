import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qr_react_app/src/models/scanModel.dart';

import 'package:latlong/latlong.dart';

class MapaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('coordenadas qr'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){},
          )
        ],
      ),
      body: _crearFlutterMap(scan),
    );
  }

  _crearFlutterMap(ScanModel scan) {
    return FlutterMap(
      options: MapOptions(
        center: scan.getLatLong(), zoom: 15.0
      ),
      layers: [
        _crearMapa(),
      ],
    );
  }

  _crearMapa() {
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken': 'pk.eyJ1IjoibWFyaWNvbmRvcmkiLCJhIjoiY2thaHFzazM2MG5kdTJybms4eGJ0d2U1aiJ9.g4pphqmRsfmq4Y5h2PER3w',
        'id': 'mapbox.satellite'
      }
    );
  }
}