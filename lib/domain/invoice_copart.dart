class InvoiceCopart {
  final double price;
  final double enviromentalFee;
  final double buyerFee;
  final double internetBidFee;
  final double gate;
  final double titlePickup;
  final double total;

  InvoiceCopart({
    required this.price,
    this.enviromentalFee = 10,
    required this.buyerFee,
    required this.internetBidFee,
    this.gate = 79.0,
    this.titlePickup = 20,
    this.total = 0,
  });
}
