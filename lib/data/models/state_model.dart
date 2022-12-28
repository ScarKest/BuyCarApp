import 'package:buycar/domain/state.dart';

class UsaStateModel extends UsaState {
  UsaStateModel({
    required super.estado,
  });

  UsaStateModel.fromJson(Map<String, dynamic> json)
      : this(
          estado: json['Estado'].toString(),
        );

  Map<String, dynamic> toJson() {
    return {'Estado': estado};
  }
}
