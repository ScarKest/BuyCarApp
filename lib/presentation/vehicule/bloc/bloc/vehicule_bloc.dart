import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buycar/data/datasource/quotations/remote_datasource_quotations.dart';
import 'package:buycar/data/models/quotations/quotation_model.dart';
import 'package:buycar/utils/calculates/invoice_calculate.dart';
import 'package:flutter/material.dart';

class VehiculeBloc extends Bloc {
  VehiculeBloc() : super(null);

  final formKey = GlobalKey<FormState>();
  final clientController = TextEditingController();
  final telephoneController = TextEditingController();
  final carController = TextEditingController();
  final lotController = TextEditingController();
  final priceController = TextEditingController();
  final stateController = TextEditingController();

  void createQuotation({
    required bool isSecurePayment,
    required bool isCleanTitle,
    required bool isPreBidFee,
    required BuildContext context,
  }) async {
    try {
      QuotationModel quotation = QuotationModel(
        client: clientController.text,
        telephone: double.parse(telephoneController.text),
        vehicleData: carController.text,
        lot: double.parse(lotController.text),
        stateUsa: state,
        bidPrice: double.parse(priceController.text),
        detailFees: await calculateTotal(
          price: double.parse(priceController.text),
          titleType: isCleanTitle ? 'clean_title' : 'non_clean_title',
          isSecurePayment: isSecurePayment,
          isPreBidFee: isPreBidFee,
        ).then((value) => value['detalle']),
        ship: 2000,
        poliza: 20,
        transfers: 50,
        documents: 20,
        placas: 20,
        tramitePlacas: 40,
        titleAndCard: 20,
        comission: 255,
        totalD: await calculateTotal(
          price: double.parse(priceController.text),
          titleType: isCleanTitle ? 'clean_title' : 'non_clean_title',
          isSecurePayment: isSecurePayment,
          isPreBidFee: isPreBidFee,
        ).then((value) => value['total']),
      );
      if (context.mounted) {
        return addQuotation(quotation).then(
          (_) => Navigator.pushNamed(context, '/invoice', arguments: quotation),
        );
      }
      log('Valoresss');
      log(calculateTotal(
        price: double.parse(priceController.text),
        titleType: 'clean_title',
        isSecurePayment: true,
        isPreBidFee: isPreBidFee,
      ).then((value) => log(value.toString())).toString());
      log('Fin valores');

      log(quotation.toString());
    } catch (e) {
      debugPrint('Error creando cotización: $e');
    }
  }
}
