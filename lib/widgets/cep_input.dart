import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/address_provider.dart';
import '../screens/loading_screen.dart';

class CepInput extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(labelText: 'Digite o CEP'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              final cep = controller.text;
              if (cep.isNotEmpty) {
                Provider.of<AddressProvider>(context, listen: false).fetchAddress(cep);
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingScreen()));
              }
            },
          ),
        ],
      ),
    );
  }
}
