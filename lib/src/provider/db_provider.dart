
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_react_app/src/models/scanModel.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider{
  static Database _database;
  static final DBProvider dbProvider = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
  if(_database != null ) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db' );
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, version) async{
        await db.execute(
          ' CREATE TABLE Scans ('
          'id INTEGER PRIMARY KEY,'
          'tipo TEXT,'
          'valor TEXT,'
          ')'
        );
      }
    );
  } 
  // CREAR REGISTROS (2 metodos)
  nuevoScanRaw(ScanModel nuevoScan) async{
    final db = await database;
    final resp = await db.rawInsert(
      "INSERT INTO Scans(id, tipo, valor) "
      "VALUES {${nuevoScan.id}, '${nuevoScan.tipo}', '${nuevoScan.valor}'}"
    );
    return resp;
  }
  nuevoScan(ScanModel nuevoScan) async{
    final db = await database;
    final resp = await db.insert('Scans', nuevoScan.toJson());
    return resp;
  }
  

} 