import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exchange_app/providers/exchange_provider.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExchangeProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.resetConvertedAmount();
    });

    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/home_img.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer<ExchangeProvider>(
                builder: (context, provider, child) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Conversor de Moedas',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Valor',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          onChanged: (value) {
                            provider.setAmount(double.tryParse(value) ?? 0);
                          },
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: colorScheme.onSurface),
                            filled: true,
                            fillColor: colorScheme.surfaceContainer.withOpacity(0.8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: colorScheme.primary,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildCurrencyDropdown(
                              provider,
                              provider.fromCurrency,
                                  (value) {
                                if (value != null) {
                                  provider.setFromCurrency(value);
                                }
                              },
                              colorScheme,
                            ),
                            const SizedBox(width: 20),
                            Icon(Icons.swap_horiz, color: colorScheme.onSurface),
                            const SizedBox(width: 20),
                            _buildCurrencyDropdown(
                              provider,
                              provider.toCurrency,
                                  (value) {
                                if (value != null) {
                                  provider.setToCurrency(value);
                                }
                              },
                              colorScheme,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => provider.convertCurrency(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.primary,
                            foregroundColor: colorScheme.onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 40,
                            ),
                          ),
                          child: const Text(
                            'Converter',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Valor Convertido: ${provider.convertedAmount.toStringAsFixed(2)} ${provider.toCurrency}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrencyDropdown(
      ExchangeProvider provider,
      String value,
      ValueChanged<String?> onChanged,
      ColorScheme colorScheme,
      ) {
    List<Map<String, String>> currencies = [
      {"currency": "USD", "name": "USD", "flag": "🇺🇸"},
      {"currency": "EUR", "name": "EUR", "flag": "🇪🇺"},
      {"currency": "GBP", "name": "GBP", "flag": "🇬🇧"},
      {"currency": "CAD", "name": "CAD", "flag": "🇨🇦"},
      {"currency": "AUD", "name": "AUD", "flag": "🇦🇺"},
      {"currency": "JPY", "name": "JPY", "flag": "🇯🇵"},
      {"currency": "CHF", "name": "CHF", "flag": "🇨🇭"},
      {"currency": "CNY", "name": "CNY", "flag": "🇨🇳"},
      {"currency": "INR", "name": "INR", "flag": "🇮🇳"},
      {"currency": "BRL", "name": "BRL", "flag": "🇧🇷"},
      {"currency": "HKD", "name": "HKD", "flag": "🇭🇰"},
      {"currency": "SGD", "name": "SGD", "flag": "🇸🇬"},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: value,
        onChanged: onChanged,
        items: currencies
            .map(
              (currency) => DropdownMenuItem(
            value: currency["currency"],
            child: Row(
              children: [
                Text(
                  currency["flag"]!,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 10),
                Text(
                  currency["name"]!,
                  style: TextStyle(color: colorScheme.onSurface),
                ),
              ],
            ),
          ),
        )
            .toList(),
        underline: Container(),
        icon: Icon(Icons.arrow_drop_down, color: colorScheme.onSurface),
      ),
    );
  }
}