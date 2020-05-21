import 'dart:async';
import 'package:qr_react_app/src/models/scanModel.dart';
import 'package:qr_react_app/src/provider/db_provider.dart';

class ScansBloc{
  static final _singleton = new ScansBloc._internal();

  factory ScansBloc(){
    return _singleton;
  }
  ScansBloc._internal(){
    //obtener scan de la base de datos
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

  dispose(){
    _scansController?.close();
  }
  obtenerScans() async {
    _scansController.sink.add(await DBProvider.dbProvider.getTodosScans());
  }
  borrarScan(int id) async{
    DBProvider.dbProvider.deleteScans(id);
  }
  borrarScanTODOS(int id) async{
    DBProvider.dbProvider.deleteAll(id);
  }


}