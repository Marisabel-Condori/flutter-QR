import 'package:flutter/material.dart';
import 'package:qr_react_app/src/models/scanModel.dart';
import 'package:qr_react_app/src/provider/db_provider.dart';

class MapasPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ScanModel>>(
      future: DBProvider.dbProvider.getTodosScans(),
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (!snapshot.hasData) {  return Center(child: CircularProgressIndicator(),); }

        final scan = snapshot.data;
        if (scan.length == 0) {
          return Center(child: Text('no hay informacion'),);
        }
        return ListView.builder(
          itemCount: scan.length,
          itemBuilder: (context, i) => ListTile(
            leading: Icon(Icons.cloud_queue, color: Theme.of(context).primaryColor,),
            title: Text(scan[i].valor),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        );
      },
    );
  }
}