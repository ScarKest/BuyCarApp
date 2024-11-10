import 'package:buycar/domain/invoice.dart';
import 'package:buycar/utils/taxes_fee/clean_title_taxes.dart';
import 'package:buycar/utils/taxes_fee/non_clean_title_taxes.dart';

double getTotal({
  required double totalInvoice,
  required double price,
  required bool cleanTitleValue,
  required Invoice invoice,
  required bool internetFeeValue,
}) {
  return getTaxes(
        price: price,
        cleanTitleValue: cleanTitleValue,
        internetFeeValue: internetFeeValue,
        invoice: invoice,
      )
      //Barco y grua
      +
      2000
      //Transferencias
      +
      50
      //Papeleria
      +
      20
      //Iva e Iprima
      +
      (getTaxes(
            price: price,
            cleanTitleValue: cleanTitleValue,
            internetFeeValue: internetFeeValue,
            invoice: invoice,
          ) *
          0.32)
      //Almacenaje y poliza
      +
      250
      //Placas
      +
      20
      //Titulo y tarjeta
      +
      20
      //Comision
      +
      255;
}

double getTaxes({
  required double price,
  required bool cleanTitleValue,
  required Invoice invoice,
  required bool internetFeeValue,
}) {
  double totalInvoice = 0;

  if (cleanTitleValue == true) {
    invoice = Invoice(
      price: price,
      buyerFee: CleanTitleTaxes().biddingFeeSecuredPayment(price),
      internetBidFee: (internetFeeValue == true)
          ? CleanTitleTaxes().virtualFeePreBid(price)
          : CleanTitleTaxes().virtualFeeLiveBid(price),
      titlePickup: 20,
    );
    totalInvoice = price +
        invoice.buyerFee +
        invoice.enviromentalFee +
        invoice.internetBidFee +
        invoice.gate +
        invoice.titlePickup;
  } else {
    invoice = Invoice(
      price: price,
      buyerFee: NonCleanTitleTaxes().biddingFeeSecuredPayment(price),
      internetBidFee: (internetFeeValue == true)
          ? NonCleanTitleTaxes().virtualFeePreBid(price)
          : NonCleanTitleTaxes().virtualFeeLiveBid(price),
      titlePickup: 20,
    );
    totalInvoice = price +
        invoice.buyerFee +
        invoice.enviromentalFee +
        invoice.internetBidFee +
        invoice.gate +
        invoice.titlePickup;
  }
  return totalInvoice;
}
