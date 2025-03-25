import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exchange_app/providers/exchange_provider.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Conversor de Moedas'),
          titleTextStyle: TextStyle(
            color: Colors.white,
            backgroundColor: Colors.transparent,
            background: null
          ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home_img.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<ExchangeProvider>(
            builder: (context, provider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    onChanged: (value) {
                      provider.setAmount(double.tryParse(value) ?? 0);
                    },
                    decoration: const InputDecoration(labelText: 'Valor'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButton<String>(
                        value: provider.fromCurrency,
                        onChanged: (value) {
                          if (value != null) {
                            provider.setFromCurrency(value);
                          }
                        },
                        items: ['USD', 'EUR', 'BRL', 'GBP']
                            .map((currency) => DropdownMenuItem(
                          value: currency,
                          child: Text(currency),
                        ))
                            .toList(),
                      ),
                      const Icon(Icons.swap_horiz),
                      DropdownButton<String>(
                        value: provider.toCurrency,
                        onChanged: (value) {
                          if (value != null) {
                            provider.setToCurrency(value);
                          }
                        },
                        items: ['USD', 'EUR', 'BRL', 'GBP']
                            .map((currency) => DropdownMenuItem(
                          value: currency,
                          child: Text(currency),
                        ))
                            .toList(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => provider.convertCurrency(),
                      child: const Text('Converter'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Valor Convertido: ${provider.convertedAmount.toStringAsFixed(2)} ${provider.toCurrency}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}