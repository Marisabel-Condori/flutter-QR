
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qr_react_app/src/models/scanModel.dart';

class MapaPage extends StatelessWidget {
  final map = MapController();

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('coordenadas qr'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){
              map.move(scan.getLatLong(), 15);
            },
          )
        ],
      ),
      body: _crearFlutterMap(scan),
      floatingActionButton: _crearBotonFlotante( context),
    );
  }

   _crearBotonFlotante( BuildContext context){
     return FloatingActionButton(
       child: Icon(Icons.repeat),
       backgroundColor: Theme.of(context).primaryColor,
       onPressed: (){}
     );
   }

  _crearFlutterMap(ScanModel scan) {
    return FlutterMap(
      mapController: map,
      options: MapOptions(
        center: scan.getLatLong(), zoom: 15.0
      ),
      layers: [
        _crearMapa(),
        _crearMarcadores(scan),
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

  _crearMarcadores(ScanModel scan){
    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          point: scan.getLatLong(),
          width: 120.0,
          height: 120.0,
          builder: (context) => Container(
            child: Icon(Icons.location_on, size: 70.0, color: Theme.of(context).primaryColor,),
          )
        )
      ]
    );
  }
}