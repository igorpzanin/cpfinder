import 'package:flutter/material.dart';
import '../models/address.dart';
import '../services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressProvider with ChangeNotifier {
  final ApiService apiService = ApiService();
  Address? _address;
  List<Address> _history = [];

  Address? get address => _address;
  List<Address> get history => _history;

  Future<void> fetchAddress(String cep) async {
    // Recebe o Map da API e o converte em Address
    final result = await apiService.fetchAddress(cep);
    if (result != null) {
      _address = Address.fromJson(result);  // Converte o Map em Address
      _history.add(_address!);
      _saveHistory();
    }
    notifyListeners();
  }

  void _saveHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> historyString = _history.map((addr) => addr.cep).toList();
    prefs.setStringList('history', historyString);
  }

  void loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? historyString = prefs.getStringList('history');
    if (historyString != null) {
      // Carregar os endereços do histórico
      _history = historyString.map((cep) => Address(cep: cep, street: '', neighborhood: '', city: '', state: '')).toList();
    }
    notifyListeners();
  }
}
