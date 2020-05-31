import 'package:latlong/latlong.dart';


class ScanModel {
    int id;
    String tipo;
    String valor;

    ScanModel({
        this.id,
        this.tipo,
        this.valor,
    }){
      if(this.valor.contains('http')){
        this.tipo = 'http';
      }else{
        this.tipo = 'geo';
      }
    }

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };

  LatLng getLatLong(){
    final latLon = valor.substring(4).split(',');
    final lat = double.parse(latLon[0]); 
    final lon = double.parse(latLon[1]); 
    print('**********LAT**********'+lat.toString());
    print('**********LON**********'+lon.toString());
    return LatLng(lat, lon);
  }
}