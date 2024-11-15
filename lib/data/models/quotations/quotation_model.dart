import 'package:buycar/domain/invoice/quotation.dart';

class QuotationModel extends Quotation {
  QuotationModel({
    required super.client,
    required super.telephone,
    required super.vehicleData,
    required super.lot,
    required super.stateUsa,
    required super.bidPrice,
    required super.ship,
    super.transfers = 50,
    super.documents = 20,
    required super.poliza,
    super.placas = 20,
    super.tramitePlacas = 40,
    super.titleAndCard = 20,
    super.comission = 255,
    required super.totalD,
    required super.totalQ,
  });

  QuotationModel.fromJson(Map<String, dynamic> json)
      : this(
          client: json['client'].toString(),
          telephone: double.parse(json['telephone'].toString()),
          vehicleData: json['vehicleData'].toString(),
          lot: double.parse(json['lot'].toString()),
          stateUsa: json['stateUsa'].toString(),
          bidPrice: double.parse(json['bidPrice'].toString()),
          ship: double.parse(json['ship'].toString()),
          poliza: double.parse(json['poliza'].toString()),
          totalD: double.parse(json['totalD'].toString()),
          totalQ: double.parse(json['totalQ'].toString()),
        );

  Map<String, dynamic> toJson() {
    return {
      'client': client,
      'telephone': telephone,
      'vehicleData': vehicleData,
      'lot': lot,
      'stateUsa': stateUsa,
      'bidPrice': bidPrice,
      'ship': ship,
      'poliza': poliza,
      'transfers': transfers,
      'documents': documents,
      'placas': placas,
      'tramitePlacas': tramitePlacas,
      'titleAndCard': titleAndCard,
      'comission': comission,
      'totalD': totalD,
      'totalQ': totalQ,
    };
  }
}
