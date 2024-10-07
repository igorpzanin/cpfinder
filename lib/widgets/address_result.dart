import 'package:flutter/material.dart';
import '../models/address.dart';

class AddressResult extends StatelessWidget {
  final Address address;

  AddressResult({required this.address});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(address.street),
      subtitle: Text('${address.neighborhood}, ${address.city} - ${address.state}'),
    );
  }
}
