import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buycar/data/datasource/quotations/remote_datasource_quotations.dart';
import 'package:buycar/data/models/quotations/quotation_model.dart';
import 'package:buycar/presentation/vehicule/bloc/vehicule_state.dart';
import 'package:buycar/utils/calculates/invoice_calculate.dart';
import 'package:flutter/material.dart';

class VehiculeBloc extends Cubit<VehiculeState> {
  VehiculeBloc() : super(VehiculeState.initial());

  void createQuotation({
    required bool isSecurePayment,
    required bool isCleanTitle,
    required bool isPreBidFee,
    required BuildContext context,
  }) async {
    try {
      QuotationModel quotation = QuotationModel(
        client: state.clientController.text,
        telephone: double.parse(state.telephoneController.text),
        vehicleData: state.carController.text,
        lot: double.parse(state.lotController.text),
        stateUsa: 'California', //stateController.text,
        bidPrice: double.parse(state.priceController.text),
        detailFees: {},
        // await calculateTotal(
        //   price: double.parse(state.priceController.text),
        //   titleType: isCleanTitle ? 'clean_title' : 'non_clean_title',
        //   isSecurePayment: isSecurePayment,
        //   isPreBidFee: isPreBidFee,
        // ).then((value) => value['detalle']),
        ship: 2000,
        poliza: 20,
        transfers: 50,
        documents: 20,
        placas: 20,
        tramitePlacas: 40,
        titleAndCard: 20,
        comission: 255,
        totalD: await calculateTotal(
          price: double.parse(state.priceController.text),
          titleType: isCleanTitle ? 'clean_title' : 'non_clean_title',
          isSecurePayment: isSecurePayment,
          isPreBidFee: isPreBidFee,
        ).then((value) => value['total']),
      );

      if (state.formKey.currentState!.validate()) {
        return addQuotation(quotation).then(
          (_) => Navigator.pushNamed(context, '/invoice', arguments: quotation),
        );
      }
    } catch (e) {
      log('Error creando cotización: $e');
    }
  }
}
