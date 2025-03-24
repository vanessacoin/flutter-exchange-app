import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class QuotePriceFetcher {
  static Future<Map<String, double>> fetchQuotePrice() async {
    final String? apiKey = dotenv.env['API_ACCESS_KEY'];

    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('API_ACCESS_KEY não foi encontrado no .env');
    }

    final Uri url = Uri.parse(
        'http://api.exchangeratesapi.io/v1/latest?access_key=$apiKey');

    try {
      if (kDebugMode) {
        print('Buscando dados da API: $url');
      }

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseJson = jsonDecode(response.body);

        if (kDebugMode) {
          print('Resposta da API: $responseJson');
        }

        if (responseJson['success'] == true) {
          final Map<String, double> rates =
          (responseJson['rates'] as Map<String, dynamic>)
              .map((key, value) => MapEntry(key, value.toDouble()));

          if (kDebugMode) {
            print('Taxas de câmbio: $rates');
          }

          return rates;
        } else {
          throw Exception('Erro na API: ${responseJson['error']['info']}');
        }
      } else {
        throw Exception('Falha ao carregar dados: Código ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Erro na requisição: $e');
      }
      throw Exception('Erro na requisição: $e');
    }
  }
}