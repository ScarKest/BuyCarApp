import 'package:buycar/domain/barco.dart';

class BarcoModel extends Ship {
  BarcoModel({
    required super.tipo,
    required super.precio,
  });

  BarcoModel.fromJson(Map<String, dynamic> json)
      : this(
          tipo: json['tipo'].toString(),
          precio: int.parse(json['precio'].toString()),
        );

  Map<String, dynamic> toJson() {
    return {
      'tipo': tipo,
      'precio': precio,
    };
  }
}
