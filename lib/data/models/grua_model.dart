import 'dart:convert';

import 'package:buycar/domain/barco.dart';

// List<BarcoModel> barcoFromJson(String str) =>
//     List<BarcoModel>.from(json.decode(str).map((x) => BarcoModel.fromJson(x)));

class BarcoModel extends Barco {
  BarcoModel({
    required tipo,
    required precio,
  }) : super(tipo: tipo.toString(), precio: int.parse(precio.toString()));

  factory BarcoModel.fromJson(Map<String, dynamic> json) => BarcoModel(
        tipo: json['Tipo'].toString(),
        precio: int.parse(json['Precio'].toString()),
      );
}
