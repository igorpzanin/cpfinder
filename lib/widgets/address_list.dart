import 'package:flutter/material.dart';
import '../models/address.dart';

class AddressList extends StatelessWidget {
  final List<Address> addresses;

  AddressList({required this.addresses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(addresses[index].street),
          subtitle: Text('${addresses[index].neighborhood}, ${addresses[index].city} - ${addresses[index].state}'),
        );
      },
    );
  }
}
