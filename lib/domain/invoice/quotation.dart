class Quotation {

  //Datos de usuario
  final Client client;
  // Datos del vehiculo, marca, modelo etc
  final VehicleData vehicleData;
  // Total con fees
  final double totalPrice;
  // Precio de barco $2000 aprox
  final double ship;
  // Precio de transferencia en banco $25
  final double transfer;
  // Poliza en frontera $100
  final double poliza;
  // iva 12% sobre la factura
  final double iva;
  // i prima 20% sobre la factura
  final double iprima;
  // Costo de placas Q120 + 350 de tramite aprox de $70
  final double placas;
  // Costo de sacar el titulo y la tarjeta Q120 aprox de $20
  final double titleAndCard;
  // Comision de Q2000 aprox $255
  final double comission;
  // Calcomania que se paga en la sat, precio variable
  final double calcomania
  // factura que emite la importadora 5% sobre el totalPrice
  final double factura;
  final double totalD;

  Quotation({
    required this.vehicleData,
    required this.totalPrice
    required this.ship, // $2000
    this.transfer = 25,
    this.poliza = 100,
    this.iva,
    this.iprima,
    this.placas = 70,
    this.titleAndCard = 20,
    this.comission = 255,
    this.calcomania,
    this.factura,
    required this.totalD,
  });
}

/*
Carro	$2,000.00 //bidprice
Total carro	$2,600.00 totalPrice
transferencias	$25.00 // transfer
Bajada	$2,000.00 //ship
Iva	$312.00 //iva
Iprima	$520.00 // iprima
poliza	$100.00 //poliza
placas	$70.00 //placas
titulo y tarjeta	$20.00 ///titleAndCard
comision	$255.00 //comission
calcomania	$80.00 //calcomania 
factura gt 	$130.00 //factura
Total	$6,112.00
*/
