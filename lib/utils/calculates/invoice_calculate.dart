import 'package:buycar/domain/invoice/invoice_copart.dart';
import 'package:buycar/utils/taxes_fee/clean_title_taxes.dart';
import 'package:buycar/utils/taxes_fee/non_clean_title_taxes.dart';

double getTotal({
  required double bidPrice,
  required bool cleanTitleValue,
  required bool internetFeeValue,
}) {
  return getTaxes(
        bidPrice: bidPrice,
        cleanTitleValue: cleanTitleValue,
        internetFeeValue: internetFeeValue,
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
            bidPrice: bidPrice,
            cleanTitleValue: cleanTitleValue,
            internetFeeValue: internetFeeValue,
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
  required double bidPrice,
  required bool cleanTitleValue,
  required bool internetFeeValue,
}) {
  InvoiceCopart invoice;
  double totalInvoice = 0;

  if (cleanTitleValue == true) {
    invoice = InvoiceCopart(
      price: bidPrice,
      buyerFee: CleanTitleTaxes().biddingFeeSecuredPayment(bidPrice),
      internetBidFee: (internetFeeValue == true)
          ? CleanTitleTaxes().virtualFeePreBid(bidPrice)
          : CleanTitleTaxes().virtualFeeLiveBid(bidPrice),
      titlePickup: 20,
    );
    totalInvoice = bidPrice +
        invoice.buyerFee +
        invoice.enviromentalFee +
        invoice.internetBidFee +
        invoice.gate +
        invoice.titlePickup;
  } else {
    invoice = InvoiceCopart(
      price: bidPrice,
      buyerFee: NonCleanTitleTaxes().biddingFeeSecuredPayment(bidPrice),
      internetBidFee: (internetFeeValue == true)
          ? NonCleanTitleTaxes().virtualFeePreBid(bidPrice)
          : NonCleanTitleTaxes().virtualFeeLiveBid(bidPrice),
      titlePickup: 20,
    );
    totalInvoice = bidPrice +
        invoice.buyerFee +
        invoice.enviromentalFee +
        invoice.internetBidFee +
        invoice.gate +
        invoice.titlePickup;
  }
  return totalInvoice;
}
