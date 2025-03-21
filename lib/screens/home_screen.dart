import 'package:exchange_app/screens/exchange_screen.dart';
import 'package:exchange_app/screens/historical_screen.dart';
import 'package:flutter/material.dart';
import '../components/navigationbar.dart';
import '../data/quote_price_fetch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreenContent(),
    ExchangeScreen(),
    HistoricalScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exchange Coin'),
        titleTextStyle: TextStyle(
          color: colors.onPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colors.primary, colors.secondary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  Map<String, double>? exchangeRates;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchExchangeRates();
  }

  Future<void> _fetchExchangeRates() async {
    try {
      final rates = await QuotePriceFetcher.fetchQuotePrice();
      setState(() {
        exchangeRates = rates;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Erro ao carregar dados: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/home_img.png',
          fit: BoxFit.cover,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: isLoading
                ? const CircularProgressIndicator()
                : errorMessage.isNotEmpty
                ? Text(
              errorMessage,
              style: TextStyle(color: colors.error, fontSize: 16),
            )
                : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cotação Atual",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: colors.onBackground,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "USD: ${exchangeRates?['USD']?.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18, color: colors.primary),
                ),
                Text(
                  "EUR: ${exchangeRates?['EUR']?.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18, color: colors.primary),
                ),
                Text(
                  "GBP: ${exchangeRates?['GBP']?.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18, color: colors.primary),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}