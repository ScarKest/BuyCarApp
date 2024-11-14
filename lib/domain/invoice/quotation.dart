class Quotation {
  final String client;
  final double telephone;
  final String vehicleData;
  final double lot;
  final String stateUsa;
  final double bidPrice;
  final double ship;
  final double transfers;
  final double documents;
  final double poliza;
  final double placas;
  final double tramitePlacas;
  final double titleAndCard;
  final double comission;
  final double totalD;
  final double totalQ;

  Quotation({
    required this.client,
    required this.telephone,
    required this.vehicleData,
    required this.lot,
    required this.stateUsa,
    required this.bidPrice,
    required this.ship,
    this.transfers = 50,
    this.documents = 20,
    //TODO Ask dad price of this
    required this.poliza,
    this.placas = 20,
     this.tramitePlacas = 40,
     this.titleAndCard =20,
     this.comission = 255,
    required this.totalD,
    required this.totalQ,
  });
}
