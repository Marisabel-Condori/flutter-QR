
import 'package:flutter/material.dart';
import 'package:qr_react_app/src/pages/direcciones_page.dart';
import 'package:qr_react_app/src/pages/mapas_page.dart';
 
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  int currentI = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QRREADER'),
        actions: <Widget>[
          Icon(Icons.delete_forever)
        ],
      ),
      body: _callPage(currentI),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _crearBottonNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
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
}