import 'package:buycar/domain/barco.dart';

class BarcoModel extends Barco {
  BarcoModel({
    required super.tipo,
    required super.precio,
  });

  BarcoModel.fromJson(Map<String, dynamic> json)
      : this(
          tipo: json['tipo'].toString(),
          precio: json['precio'].toString(),
        );

  Map<String, dynamic> toJson() {
    return {
      'tipo':tipo,
      'precio': precio
    };
  }
}
