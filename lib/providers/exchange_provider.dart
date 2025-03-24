import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:exchange_app/data/database_helper.dart';

class ExchangeProvider extends ChangeNotifier {
  double _amount = 0.0;
  String _fromCurrency = 'USD';
  String _toCurrency = 'BRL';
  double _convertedAmount = 0.0;

  double get amount => _amount;
  String get fromCurrency => _fromCurrency;
  String get toCurrency => _toCurrency;
  double get convertedAmount => _convertedAmount;

  void setAmount(double value) {
    _amount = value;
    notifyListeners();
  }

  void setFromCurrency(String currency) {
    _fromCurrency = currency;
    notifyListeners();
  }

  void setToCurrency(String currency) {
    _toCurrency = currency;
    notifyListeners();
  }

  Future<void> convertCurrency() async {
    String url =
        'https://economia.awesomeapi.com.br/json/last/$_fromCurrency-$_toCurrency';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String key = '$_fromCurrency$_toCurrency';
        double exchangeRate = double.parse(data[key]['bid']);

        _convertedAmount = _amount * exchangeRate;
        notifyListeners();

        final record = {
          'amount': _amount,
          'fromCurrency': _fromCurrency,
          'toCurrency': _toCurrency,
          'convertedAmount': _convertedAmount,
          'date': DateTime.now().toIso8601String(),
        };

        final dbHelper = DatabaseHelper();
        await dbHelper.insertExchange(record);

        print('Registro inserido no banco: $record');
      } else {
        throw Exception('Erro ao buscar a taxa de câmbio');
      }
    } catch (e) {
      print('Erro: $e');
    }
  }
}