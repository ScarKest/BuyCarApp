import 'package:buycar/data/datasource/quotations/remote_datasource_quotations.dart';
import 'package:buycar/domain/invoice/quotation.dart';
import 'package:flutter/material.dart';

class HistoryTransactionsScreen extends StatefulWidget {
  const HistoryTransactionsScreen({super.key});

  @override
  State<HistoryTransactionsScreen> createState() =>
      _HistoryTransactionsScreenState();
}

class _HistoryTransactionsScreenState extends State<HistoryTransactionsScreen> {
  List<Quotation> quotationsList = [];
  Future<void> _getQuotations() async {
    quotationsList = await getQuotations();
    setState(() {});
  }

  @override
  void initState() {
    _getQuotations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
      ),
      body: ListView(
        children: quotationsList
            .map((quotation) => ListTile(
                  title: Text(quotation.client),
                  subtitle: Text(quotation.vehicleData),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () =>
                      Navigator.pushNamed(context, '/invoice', arguments: quotation),
                ))
            .toList(),
      ),
    );
  }
}
