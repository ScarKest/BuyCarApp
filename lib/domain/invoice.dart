class Invoice {
  final double price;
  final double enviromentalFee;
  final double buyerFee;
  final double internetBidFee;
  final double gate;
  final double? titlePickup;

  Invoice({
    required this.price,
     this.enviromentalFee = 0.0,
    required this.buyerFee,
    required this.internetBidFee,
    this.gate = 0.0,
    required this.titlePickup,
  });
}
