import 'package:flutter/material.dart';
import 'package:qr_react_app/src/models/scanModel.dart';
import 'package:qr_react_app/src/bloc/scans_bloc.dart';
import 'package:qr_react_app/src/utils/scan_utils.dart' as util;

class MapasPage extends StatelessWidget {
  final scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scanStream,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (!snapshot.hasData) {  return Center(child: CircularProgressIndicator(),); }

        final scan = snapshot.data;
        if (scan.length == 0) {
          return Center(child: Text('no hay informacion'),);
        }
        return ListView.builder(
          itemCount: scan.length,
          itemBuilder: (context, i) => Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red),
            onDismissed: (direction) => scansBloc.borrarScan(scan[i].id),
            child: ListTile(
              leading: Icon(Icons.cloud_queue, color: Theme.of(context).primaryColor,),
              title: Text(scan[i].valor),
              subtitle: Text('ID: ${scan[i].id}'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey,),
              onTap: (){util.abrirScan(context, scan[i]);},
            ),
          ),
        );
      },
    );
  }
}