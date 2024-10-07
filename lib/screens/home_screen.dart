import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/address_provider.dart';
import '../widgets/cep_input.dart';
import '../widgets/address_result.dart';
import 'loading_screen.dart';
import 'not_found_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddressProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de Endereço'),
      ),
      body: Column(
        children: [
          CepInput(),
          SizedBox(height: 20),
          provider.address != null
              ? AddressResult(address: provider.address!)
              : provider.address == null && provider.history.isEmpty
              ? Container()
              : NotFoundScreen(),
        ],
      ),
    );
  }
}
