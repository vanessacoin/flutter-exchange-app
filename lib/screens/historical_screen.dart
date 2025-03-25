import 'package:flutter/material.dart';
import '../data/database_helper.dart';
import 'package:intl/intl.dart';

class HistoricalScreen extends StatefulWidget {
  const HistoricalScreen({super.key});

  @override
  _HistoricalScreenState createState() => _HistoricalScreenState();
}

class _HistoricalScreenState extends State<HistoricalScreen> {
  List<Map<String, dynamic>> _history = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    try {
      final history = await DatabaseHelper().getExchangeHistory();
      setState(() {
        _history = history;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Erro ao carregar histórico: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Histórico de Conversões',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: colorScheme.onPrimary,
          ),
        ),
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
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _errorMessage.isNotEmpty
              ? Center(
            child: Text(
              _errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          )
              : _history.isEmpty
              ? Center(
            child: Text(
              'Nenhum histórico disponível',
              style: TextStyle(color: colorScheme.onSurface),
            ),
          )
              : ListView.builder(
            padding: EdgeInsets.fromLTRB(
                16, kToolbarHeight + 32, 16, 16),
            itemCount: _history.length,
            itemBuilder: (context, index) {
              final item = _history[index];
              final formattedDate = _formatDate(item['date']);
              return Card(
                color: colorScheme.surfaceContainer.withOpacity(0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(bottom: 16),
                child: ListTile(
                  title: Text(
                    '${item['amount']} ${item['fromCurrency']} → ${item['toCurrency']}',
                    style: TextStyle(color: colorScheme.onSurface),
                  ),
                  subtitle: Text(
                    'Convertido: ${item['convertedAmount'].toStringAsFixed(2)} | $formattedDate',
                    style: TextStyle(color: colorScheme.onSurfaceVariant),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String _formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('dd/MM/yyyy HH:mm').format(parsedDate);
    } catch (e) {
      return date;
    }
  }
}