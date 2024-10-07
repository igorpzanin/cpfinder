// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>?> fetchAddress(String cep) async {
    try {
      final response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Verifica se o retorno contém um erro
        if (data.containsKey('erro')) {
          return null;  // CEP não encontrado
        }

        return data;
      } else {
        return null;  // Erro na requisição
      }
    } catch (e) {
      // Captura erros na requisição
      return null;
    }
  }
}
