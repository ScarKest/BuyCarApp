import 'package:buycar/presentation/history/history_transactions_screen.dart';
import 'package:buycar/presentation/home/home_screen.dart';
import 'package:buycar/presentation/invoice/invoice_screen.dart';
import 'package:buycar/presentation/pages/invoice_screen.dart';
import 'package:buycar/presentation/pages/ships_screen.dart';
import 'package:buycar/presentation/vehicule/vehicule_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      routes: {
        '/vehicule': (context) => const VehiculeScreen(),
        '/history_transactions': (context) => HistoryTransactionsScreen(),
        '/ships': (context) => const ShipsScreen(),
        '/invoice': (context) => const QuotationScreen(),
        '/invoiceCopart': (context) => const InvoiceCopartScreen(),
      },
    );
  }
}
