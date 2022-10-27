import 'package:buycar/domain/port.dart';

class PortModel extends Port {
  PortModel({
    required super.puerto,
  });

  PortModel.fromJson(Map<String, dynamic> json)
      : this(
          puerto: json['Puerto'].toString(),
        );

  Map<String, dynamic> toJson() {
    return {
      'Puerto': puerto,
    };
  }
}
