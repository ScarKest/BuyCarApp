import 'package:buycar/data/models/barco_model.dart';
import 'package:buycar/domain/barco.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Ship>> conectionFirebase() async {
  final response = <Ship>[];
  final collectionReference =
      FirebaseFirestore.instance.collection('barco').withConverter<BarcoModel>(
            fromFirestore: (snap, _) => BarcoModel.fromJson(snap.data()!),
            toFirestore: (barco, _) => barco.toJson(),
          );
  final barcos = await collectionReference.get();
  for (final barco in barcos.docs) {
    response.add(barco.data());
  }
  return response;
}
