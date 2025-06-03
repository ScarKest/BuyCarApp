class Quotation {
  // Nombre del usuario
  final String client;
  final double telephone;
  // Datos del vehiculo, marca, modelo etc
  final String vehicleData;
  // Lote en copart
  final double lot;
  final String stateUsa;
  // Puja que le pueden ofertar
  final double bidPrice;
  // Puja que le pueden ofertar
  final Map<String, double> detailFees;
  // Precio de barco
  final double ship;
  // Precio de transferencias en banco $25 c/u
  final double transfers;
  // Documentacion en Frontera
  final double documents;
  // Poliza en frontera
  final double poliza;
  // Costo de placas Q120 aprox de $20
  final double placas;
  // Costo de ir a sacar las placas Q350 aprox de $50
  final double tramitePlacas;
  // Costo de sacar el titulo y la tarjeta Q120 aprox de $20
  final double titleAndCard;
  // Comision de Q2000
  final double comission;
  final double totalD;

  Quotation({
    required this.client,
    required this.telephone,
    required this.vehicleData,
    required this.lot,
    required this.stateUsa,
    required this.bidPrice,
    required this.detailFees,
    required this.ship,
    this.transfers = 50,
    this.documents = 20,
    //TODO Ask dad price of this
    required this.poliza,
    this.placas = 20,
    this.tramitePlacas = 50,
    this.titleAndCard = 20,
    this.comission = 255,
    required this.totalD,
  });
}
