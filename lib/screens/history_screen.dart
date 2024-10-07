import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/address_provider.dart';
import '../widgets/address_list.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddressProvider>(context);
    provider.loadHistory();

    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Endereços'),
      ),
      body: AddressList(addresses: provider.history),
    );
  }
}
