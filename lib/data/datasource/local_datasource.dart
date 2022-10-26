import 'package:buycar/data/models/barco_model.dart';
import 'package:buycar/data/models/port_model.dart';
import 'package:buycar/data/models/state_model.dart';
import 'package:buycar/domain/barco.dart';
import 'package:buycar/domain/port.dart';
import 'package:buycar/domain/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Ship>> getShips() async {
  final response = <Ship>[];
  final collectionReference =
      FirebaseFirestore.instance.collection('barco/').withConverter<BarcoModel>(
            fromFirestore: (snap, _) => BarcoModel.fromJson(snap.data()!),
            toFirestore: (barco, _) => barco.toJson(),
          );
  final barcos = await collectionReference.get();
  for (final barco in barcos.docs) {
    response.add(barco.data());
  }
  print('=====Barcos: ${response.last.tipo}=====');
  return response;
}

Future<List<Port>> getPorts() async {
  final response = <Port>[];
  final collectionReference = FirebaseFirestore.instance
      .collection('puerto')
      .withConverter<PortModel>(
        fromFirestore: (snap, _) => PortModel.fromJson(snap.data()!),
        toFirestore: (port, _) => port.toJson(),
      );
  final ports = await collectionReference.get();
  for (final port in ports.docs) {
    response.add(port.data());
  }

  return response;
}

Future<List<States>> getStates() async {
  final response = <States>[];
  final collectionReference =
      FirebaseFirestore.instance
      // .collection('Arizona')
          .collection('california').doc('California').collection('Ciudades')
          .withConverter<StatesModel>(
            fromFirestore: (snap, _) => StatesModel.fromJson(snap.data()!),
            toFirestore: (state, _) => state.toJson(),
          );
  final states = await collectionReference.get();
  for (final state in states.docs) {
    response.add(state.data());
    print('=====Estado: ${state.data().ciudad}=====');
  }
  return response;
}
