import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';

Future<Map<String, dynamic>> calculateTotal({
  required double price,
  required String titleType,
  required bool isPreBidFee,
  required bool isSecurePayment,
}) async {
  String jsonString = await rootBundle.loadString('assets/data/fees.json');
  Map<String, dynamic> feesData = json.decode(jsonString);
  Map<String, dynamic> fees = feesData[titleType];

  double total = 0;
  Map<String, double> detailFees = {};

  // Obtener tarifa de bidding
  // String metodoPago = isSecurePayment ? "secure_payment" : "unsecure_payment";
  log('Feeessssss ${fees["bidding_fees"][1]}');
  detailFees["Bidding Fee"] =
      _buscarFee(fees["bidding_fees"](isSecurePayment) ? [0] : [1], price);
  total += detailFees["Bidding Fee"]!;

  // Obtener tarifas de virtual bid
  for (var bidType in fees["virtual_bid_fee"]) {
    if (isPreBidFee) {
      // String feeName = bidType.keys.first;
      detailFees['pre_bid_fees'] = _buscarFee(bidType.values.first, price);
      total += detailFees['pre_bid_fees']!;
    } else {
      detailFees['live_bid_fees'] = _buscarFee(bidType.values.first, price);
      total += detailFees['live_bid_fees']!;
    }
  }

  // Sumar tarifas fijas
  detailFees["Gate Fee"] = fees["gate_fee"].toDouble();
  detailFees["Environmental Fee"] = fees["environmental_fee"].toDouble();
  detailFees["Title PickUp"] = fees["title_pickup"].toDouble();
  total += detailFees["Gate Fee"]! +
      detailFees["Environmental Fee"]! +
      detailFees["Title PickUp"]!;

  return {
    "total": total,
    "detalle": detailFees,
  };
}

// Función para buscar el fee correcto en un rango de precios
double _buscarFee(List<dynamic> lista, double precio) {
  for (var fee in lista) {
    double min = fee["min"];
    double? max = fee["max"];
    if (precio >= min && (max == null || precio <= max)) {
      return fee["fee"] is String
          ? precio * (double.parse(fee["fee"].replaceAll('%', '')) / 100)
          : fee["fee"];
    }
  }
  return 0;
}

// import 'package:buycar/domain/invoice/invoice_copart.dart';
// import 'package:buycar/utils/taxes_fee/clean_title_taxes.dart';
// import 'package:buycar/utils/taxes_fee/non_clean_title_taxes.dart';

// double getTotal({
//   required double bidPrice,
//   required bool cleanTitleValue,
//   required bool internetFeeValue,
// }) {
//   return getTaxes(
//         bidPrice: bidPrice,
//         cleanTitleValue: cleanTitleValue,
//         internetFeeValue: internetFeeValue,
//       )
//       //Barco y grua
//       +
//       2000
//       //Transferencias
//       +
//       50
//       //Papeleria
//       +
//       20
//       //Iva e Iprima
//       +
//       (getTaxes(
//             bidPrice: bidPrice,
//             cleanTitleValue: cleanTitleValue,
//             internetFeeValue: internetFeeValue,
//           ) *
//           0.32)
//       //Almacenaje y poliza
//       +
//       250
//       //Placas
//       +
//       20
//       //Titulo y tarjeta
//       +
//       20
//       //Comision
//       +
//       255;
// }

// double getTaxes({
//   required double bidPrice,
//   required bool cleanTitleValue,
//   required bool internetFeeValue,
// }) {
//   InvoiceCopart invoice;
//   double totalInvoice = 0;

//   if (cleanTitleValue == true) {
//     invoice = InvoiceCopart(
//       price: bidPrice,
//       buyerFee: CleanTitleTaxes().biddingFeeSecuredPayment(bidPrice),
//       internetBidFee: (internetFeeValue == true)
//           ? CleanTitleTaxes().virtualFeePreBid(bidPrice)
//           : CleanTitleTaxes().virtualFeeLiveBid(bidPrice),
//       titlePickup: 20,
//     );
//     totalInvoice = bidPrice +
//         invoice.buyerFee +
//         invoice.enviromentalFee +
//         invoice.internetBidFee +
//         invoice.gate +
//         invoice.titlePickup;
//   } else {
//     invoice = InvoiceCopart(
//       price: bidPrice,
//       buyerFee: NonCleanTitleTaxes().biddingFeeSecuredPayment(bidPrice),
//       internetBidFee: (internetFeeValue == true)
//           ? NonCleanTitleTaxes().virtualFeePreBid(bidPrice)
//           : NonCleanTitleTaxes().virtualFeeLiveBid(bidPrice),
//       titlePickup: 20,
//     );
//     totalInvoice = bidPrice +
//         invoice.buyerFee +
//         invoice.enviromentalFee +
//         invoice.internetBidFee +
//         invoice.gate +
//         invoice.titlePickup;
//   }
//   return totalInvoice;
// }
