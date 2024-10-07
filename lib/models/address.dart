// lib/models/address.dart
class Address {
  final String cep;
  final String street;
  final String neighborhood;
  final String city;
  final String state;

  Address({
    required this.cep,
    required this.street,
    required this.neighborhood,
    required this.city,
    required this.state,
  });

  // Método fromJson para converter um Map em Address
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      cep: json['cep'] ?? '',
      street: json['logradouro'] ?? '',
      neighborhood: json['bairro'] ?? '',
      city: json['localidade'] ?? '',
      state: json['uf'] ?? '',
    );
  }
}
