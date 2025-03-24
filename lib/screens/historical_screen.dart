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
    return Scaffold(
      appBar: AppBar(title: const Text('Histórico de Conversões')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator()) // Indicador de carregamento
          : _errorMessage.isNotEmpty
          ? Center(child: Text(_errorMessage, style: const TextStyle(color: Colors.red)))
          : _history.isEmpty
          ? const Center(child: Text('Nenhum histórico disponível'))
          : ListView.builder(
        itemCount: _history.length,
        itemBuilder: (context, index) {
          final item = _history[index];
          final formattedDate = _formatDate(item['date']);
          return ListTile(
            title: Text('${item['amount']} ${item['fromCurrency']} → ${item['toCurrency']}'),
            subtitle: Text('Convertido: ${item['convertedAmount'].toStringAsFixed(2)} | $formattedDate'),
          );
        },
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