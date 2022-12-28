import 'package:buycar/domain/city.dart';

class CityModel extends City {
  CityModel({
    required super.ciudad,
    required super.precio,
  });

  CityModel.fromJson(Map<String, dynamic> json)
      : this(
          ciudad: json['Ciudad'].toString(),
          precio: int.parse(json['Precio'].toString()),
        );

  Map<String, dynamic> toJson() {
    return {
      'Ciudad': ciudad,
      'Precio': precio,
    };
  }
}
