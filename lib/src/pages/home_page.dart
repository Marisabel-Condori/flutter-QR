
import 'package:flutter/material.dart';
import 'package:qr_react_app/src/models/scanModel.dart';
import 'package:qr_react_app/src/bloc/scans_bloc.dart';
import 'package:qr_react_app/src/utils/scan_utils.dart' as util;

import 'package:qrscan/qrscan.dart' as scanner;
import 'package:qr_react_app/src/pages/direcciones_page.dart';
import 'package:qr_react_app/src/pages/mapas_page.dart';
 
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scansBloc = new ScansBloc();

  int currentI = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QRREADER', style: TextStyle(color: Colors.white) ),
        actions: <Widget>[
          IconButton(icon: Icon( Icons.delete_forever, color: Colors.white,), onPressed: scansBloc.borrarScanTODOS)
        ],
      ),
      body: _callPage(currentI),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _crearBottonNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed:() => _scanQr(context),
        child: Icon(Icons.zoom_out_map),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _callPage(int paginaActual){
    switch (paginaActual) {
      case 0: return DireccionesPage();
      case 1: return MapasPage();
      default: return DireccionesPage();
    }
  }

  Widget _crearBottonNavigationBar(){
    return BottomNavigationBar(
      currentIndex: currentI,
      onTap: (index){
        setState(() {
          currentI = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text('direcciones')),
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('mapas')),
      ]
    );
  }
  _scanQr(BuildContext context) async{
    /* https://mari
       geo:40.79496711003821,-73.60494032343753
    */

    //String futureString = '';

    String futureString = 'https://google.com';

  /*  try {
      futureString = await scanner.scan();
    } catch (e) {
      futureString = e.toString();
    }*/
  //  print('futureString: $futureString');
    if(futureString != null){
      final scan = ScanModel(valor: futureString);
      scansBloc.agregarScan(scan);

      final scan2 = ScanModel(valor: 'geo:40.79496711003821,-73.60494032343753');
      scansBloc.agregarScan(scan2);

    util.abrirScan(context ,scan);
    }
  }
  
  
}