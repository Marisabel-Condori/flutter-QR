import 'package:flutter/material.dart';
import 'package:qr_react_app/src/pages/home_page.dart';
import 'package:qr_react_app/src/pages/mapa_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR APP',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'mapa': (BuildContext context) => MapaPage()
      },
      theme: ThemeData(primaryColor: Colors.greenAccent),
    );
  }
}
