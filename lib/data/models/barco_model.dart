import 'dart:convert';

import 'package:buycar/domain/barco.dart';

BarcoModel barcoModelFromMap(String str) =>
    BarcoModel.fromMap(json.decode(str) as Map<String,String>);

class BarcoModel extends Barco {
  BarcoModel({
    required super.tipo,
    required super.precio,
  });

  factory BarcoModel.fromMap(Map<String, dynamic> json) => BarcoModel(
        precio: json['precio'].toString(),
        tipo: json['tipo'].toString(),
      );
}
