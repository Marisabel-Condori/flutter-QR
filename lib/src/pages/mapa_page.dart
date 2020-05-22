import 'package:flutter/material.dart';
import 'package:qr_react_app/src/models/scanModel.dart';

class MapaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: <Widget>[
          Icon(Icons.my_location)
        ],
      ),
      body: Text(scan.valor),
    );
  }
}