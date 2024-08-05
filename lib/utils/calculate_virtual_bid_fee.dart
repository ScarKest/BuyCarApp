int calculateVirtualFee(int price, String typePayment) {
  final feePreBid = <List<int>>[
    [100, 0],
    [500, 39],
    [1000, 49],
    [1500, 69],
    [2000, 79],
    [4000, 89],
    [6000, 99],
    [8000, 119],
    [8001, 129],
 
  ];
  final feeLiveBid = <List<int>>[
    [100, 0],
    [500, 49],
    [1000, 59],
    [1500, 79],
    [2000, 89],
    [4000, 99],
    [6000, 109],
    [8000, 139],
    [8001, 149],
  ];
  if (typePayment == 'PreBid') {
    for (final feeEntry in feePreBid) {
      if (price < feeEntry[0]) {
        return feeEntry[1];
      }
    }
  } else {
    for (final feeEntry in feeLiveBid) {
      if (price < feeEntry[0]) {
        return feeEntry[1];
      }
    }
  }
  return 0;
}
