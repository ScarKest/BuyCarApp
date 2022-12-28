import 'package:buycar/presentation/widgets/invoice_widget.dart';
import 'package:buycar/presentation/widgets/ship_widget.dart';
import 'package:flutter/material.dart';

class OwnerScreen extends StatefulWidget {
  const OwnerScreen({super.key});

  @override
  State<OwnerScreen> createState() => _OwnerScreenState();
}

class _OwnerScreenState extends State<OwnerScreen> {
  //Variables para calcular
  final _total = 0;
  int invoicePrice = 0;
  int shipPrice = 0;
  int guatemalaPrice = 0;

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dueño'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_boat)),
              Tab(icon: Icon(Icons.money)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            InvoiceWidget(user: user.toString()),
            ShipWidget(user: user.toString()),
            const Icon(Icons.directions_bike),
          ],
        ),
        bottomSheet: _customBottomSheet(),
      ),
    );
  }

  Widget _customBottomSheet() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 150,
      color: Colors.lightBlue,
      child: Text(
        'Precio \$$_total',
        style: const TextStyle(
          fontSize: 35,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
