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
  Stream<List<ScanModel>> get scanStream => _scansController.stream;

  dispose(){
    _scansController?.close();
  }
  obtenerScans() async {
    _scansController.sink.add(await DBProvider.dbProvider.getTodosScans());
  }
  agregarScan(ScanModel scan) async{
    await DBProvider.dbProvider.nuevoScan(scan);
    obtenerScans();
  }
  borrarScan(int id) async{
    await DBProvider.dbProvider.deleteScans(id);
    obtenerScans();
  }
  borrarScanTODOS() async{
    await DBProvider.dbProvider.deleteAll();
    obtenerScans();
  }


}