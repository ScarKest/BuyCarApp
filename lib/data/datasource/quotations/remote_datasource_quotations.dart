import 'package:buycar/data/models/quotations/quotation_model.dart';
import 'package:buycar/domain/invoice/quotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Quotation>> getQuotations() async {
  final response = <Quotation>[];
  final collectionReference = FirebaseFirestore.instance
      .collection('quotations/')
      .withConverter<QuotationModel>(
        fromFirestore: (snap, _) => QuotationModel.fromJson(snap.data()!),
        toFirestore: (quotation, _) => quotation.toJson(),
      );
  final quotations = await collectionReference.get();
  for (final quotation in quotations.docs) {
    response.add(quotation.data());
  }
  return response;
}

Future<Quotation?> addQuotation(QuotationModel quotation) async {
  FirebaseFirestore.instance.collection('quotations/').add(quotation.toJson());
  // .withConverter<QuotationModel>(
  //   fromFirestore: (snap, _) => QuotationModel.fromJson(snap.data()!),
  //   toFirestore: (quotation, _) => quotation.toJson(),
  // );
  return null;
}
