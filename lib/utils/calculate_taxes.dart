// ignore_for_file: invariant_booleans

int calculateBuyerFee(String user, int price) => (user == 'Owner')
    ? calculateBuyerFeeOwner(price)
    : calculateBuyerFeeClient(price);

int calculateBuyerFeeOwner(int price) {
  if (price < 50) return 25;
  if (50 < price && price < 100) return 45;
  if (100 < price && price < 200) return 80;
  if (200 < price && price < 400) return 120;
  if (400 < price && price < 500) return 160;
  if (500 < price && price < 600) return 185;

  return 0;
}

int calculateBuyerFeeClient(int price) {
  if (price < 50) return 25;
  if (50 < price && price < 100) return 45;
  return 0;
}

int calculateVirtualFee(String user, int price) => (user == 'Owner')
    ? calculateVirtualFeeOwner(price)
    : calculateVirtualFeeClient(price);

int calculateVirtualFeeOwner(int price) {
  if (price < 50) return 12;
  return 0;
}

int calculateVirtualFeeClient(int price) {
  if (price < 50) return 12;
  return 0;
}
