// lib/main.dart
import 'package:flutter/material.dart';
import 'services/api_service.dart'; // Importe a ApiService

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta de CEP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cepController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  Map<String, dynamic>? _addressData;

  void _searchAddress() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _addressData = null;
    });

    ApiService apiService = ApiService();
    final result = await apiService.fetchAddress(_cepController.text);

    setState(() {
      _isLoading = false;
      if (result != null) {
        _addressData = result;
      } else {
        _errorMessage = 'Endereço não encontrado ou erro na requisição.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buscar Endereço')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cepController,
              decoration: InputDecoration(labelText: 'Digite o CEP'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _searchAddress,
              child: Text('Buscar'),
            ),
            SizedBox(height: 16),
            if (_isLoading)
              CircularProgressIndicator(),  // Exibe loading enquanto está carregando
            if (_errorMessage != null)
              Text(_errorMessage!, style: TextStyle(color: Colors.red)),
            if (_addressData != null)
              Text('Endereço: ${_addressData!['logradouro'] ?? 'N/A'}'),
          ],
        ),
      ),
    );
  }
}
