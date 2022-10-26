import 'package:buycar/domain/port.dart';
import 'package:buycar/domain/state.dart';

class StatesModel extends States {
  StatesModel({
    required super.ciudad,
    required super.precio,
  });

  StatesModel.fromJson(Map<String, dynamic> json)
      : this(
          ciudad: json['Ciudad'].toString(),
          precio: json['Precio'].toString(),
        );

  Map<String, dynamic> toJson() {
    return {'precio': precio};
  }
}
