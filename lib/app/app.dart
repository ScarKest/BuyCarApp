import 'package:buycar/presentation/client/client_screen.dart';
import 'package:buycar/presentation/history/history_transactions_screen.dart';
import 'package:buycar/presentation/home/home_screen.dart';
import 'package:buycar/presentation/invoice/invoice_screen.dart';
import 'package:buycar/presentation/owner/owner_screen.dart';
import 'package:buycar/presentation/packages/packages_screen.dart';
import 'package:buycar/presentation/pages/cities_screen.dart';
import 'package:buycar/presentation/pages/invoice_screen.dart';
import 'package:buycar/presentation/pages/ports_screen.dart';
import 'package:buycar/presentation/pages/ships_screen.dart';
import 'package:buycar/presentation/pages/states_screen.dart';
import 'package:buycar/presentation/vehicule/vehicule_screen.dart';
import 'package:buycar/presentation/widgets/ship_widget.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      routes: {
        '/owner': (context) => const OwnerScreen(),
        '/package': (context) => const PackagesScreen(),
        '/vehicule': (context) => const VehiculeScreen(),
        '/client': (context) => const ClientScreen(),
        '/ships': (context) => const ShipsScreen(),
        '/ports': (context) => const PortsScreen(),
        '/states': (context) => const StatesScreen(),
        '/cities': (context) => const CitiesScreen(),
        '/invoice': (context) => const QuotationScreen(),
        '/invoiceCopart': (context) => const InvoiceCopartScreen(),
        '/ship': (context) => const ShipWidget(),
        '/history_transactions': (context) => HistoryTransactionsScreen(),
      },
    );
  }
}
