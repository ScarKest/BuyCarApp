import 'dart:convert';

import 'package:buycar/domain/barco.dart';

BarcoModel barcoModelFromJson(String str) =>
    BarcoModel.fromJson(jsonDecode(str));

class BarcoModel extends Barco {
  BarcoModel({
    required super.california,
    required super.florida,
  });

  factory BarcoModel.fromJson(dynamic json) => BarcoModel(
        florida: json['florida'] as List<Port>,
        // .map((port) => Port(
        // size: port['size'].toString(),
        // price: int.parse(port['price'].toString()))) as List<Port>,
        // florida: [
        //   Port(size: json['size'].toString(), price: 10),
        // ],
        california: [
          Port(size: 'Grande', price: 20),
        ],
        // california: List<Port>.from(
        //   json['california'].map(BarcoModel.fromJson) as List<Port>,
        // ).toList(),
      );
}

class PortModel extends Port {
  PortModel({
    required super.size,
    required super.price,
  });
  factory PortModel.fromJson(Map<String, dynamic> json) => PortModel(
        size: json['Size'].toString(),
        price: int.parse(
          json['Price'].toString(),
        ),
      );
}
