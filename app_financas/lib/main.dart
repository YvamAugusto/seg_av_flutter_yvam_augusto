import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => PaginaMoedas(),
      '/acoes': (context) => PaginaAcoes(),
      '/bitcoin': (context) => PaginaBitcoin(),
    },
  ));
}

class PaginaMoedas extends StatefulWidget {
  @override
  _PaginaMoedasState createState() => _PaginaMoedasState();
}

class _PaginaMoedasState extends State<PaginaMoedas> {
  Map<String, dynamic> dadosFinanceiros = {};

  Future<void> pesquisarDadosFinanceiros() async {
    try {
      final response = await http.get(Uri.parse("https://api.hgbrasil.com/finance?key=82463c36"));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        setState(() {
          dadosFinanceiros = responseData;
        });
      } else {
        throw Exception('Não foi possível realizar a requisição.');
      }
    } catch (e) {
      print('Erro na requisição: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    pesquisarDadosFinanceiros();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Finanças de Hoje'),
        backgroundColor: Colors.green[900],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const Align(
              alignment: Alignment.center,
              child: Text('Moedas', style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 30),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.black, 
                  width: 1)
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dadosFinanceiros['results']['currencies']['USD']['name'].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    dadosFinanceiros['results']['currencies']['USD']['buy'].toStringAsFixed(4),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: dadosFinanceiros['results']['currencies']['USD']['variation'] > 0 ? Colors.blue : Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      dadosFinanceiros['results']['currencies']['USD']['variation'].toStringAsFixed(4),
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dadosFinanceiros['results']['currencies']['EUR']['name'].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    dadosFinanceiros['results']['currencies']['EUR']['buy'].toStringAsFixed(4),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: dadosFinanceiros['results']['currencies']['EUR']['variation'] > 0 ? Colors.blue : Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      dadosFinanceiros['results']['currencies']['EUR']['variation'].toStringAsFixed(4),
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dadosFinanceiros['results']['currencies']['ARS']['name'].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    dadosFinanceiros['results']['currencies']['ARS']['buy'].toStringAsFixed(4),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: dadosFinanceiros['results']['currencies']['ARS']['variation'] > 0 ? Colors.blue : Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      dadosFinanceiros['results']['currencies']['ARS']['variation'].toStringAsFixed(4),
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dadosFinanceiros['results']['currencies']['JPY']['name'].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    dadosFinanceiros['results']['currencies']['JPY']['buy'].toStringAsFixed(4),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: dadosFinanceiros['results']['currencies']['JPY']['variation'] > 0 ? Colors.blue : Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      dadosFinanceiros['results']['currencies']['JPY']['variation'].toStringAsFixed(4),
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/acoes', arguments: dadosFinanceiros);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[900],
              ),
              child: const Text('Ir para Ações'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaginaAcoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic>? dadosFinanceiros= ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finanças de Hoje'),
        backgroundColor: Colors.green[900],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const Align(
              alignment: Alignment.center,
              child: Text('Ações', style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 30),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.black, 
                  width: 1)
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dadosFinanceiros!['results']['stocks']['IBOVESPA']['name'].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    dadosFinanceiros['results']['stocks']['IBOVESPA']['points'].toStringAsFixed(2),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: dadosFinanceiros['results']['stocks']['IBOVESPA']['variation'] > 0 ? Colors.blue : Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      dadosFinanceiros['results']['stocks']['IBOVESPA']['variation'].toStringAsFixed(2),
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dadosFinanceiros['results']['stocks']['IFIX']['name'].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    dadosFinanceiros['results']['stocks']['IFIX']['points'].toStringAsFixed(2),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: dadosFinanceiros['results']['stocks']['IFIX']['variation'] > 0 ? Colors.blue : Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      dadosFinanceiros['results']['stocks']['IFIX']['variation'].toStringAsFixed(2),
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dadosFinanceiros['results']['stocks']['NASDAQ']['name'].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    dadosFinanceiros['results']['stocks']['NASDAQ']['points'].toStringAsFixed(2),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: dadosFinanceiros['results']['stocks']['NASDAQ']['variation'] > 0 ? Colors.blue : Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      dadosFinanceiros['results']['stocks']['NASDAQ']['variation'].toStringAsFixed(2),
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dadosFinanceiros['results']['stocks']['DOWJONES']['name'].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    dadosFinanceiros['results']['stocks']['DOWJONES']['points'].toStringAsFixed(2),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: dadosFinanceiros['results']['stocks']['DOWJONES']['variation'] > 0 ? Colors.blue : Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      dadosFinanceiros['results']['stocks']['DOWJONES']['variation'].toStringAsFixed(2),
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dadosFinanceiros['results']['stocks']['CAC']['name'].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    dadosFinanceiros['results']['stocks']['CAC']['points'].toStringAsFixed(2),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: dadosFinanceiros['results']['stocks']['CAC']['variation'] > 0 ? Colors.blue : Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      dadosFinanceiros['results']['stocks']['CAC']['variation'].toStringAsFixed(2),
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dadosFinanceiros['results']['stocks']['NIKKEI']['name'].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    dadosFinanceiros['results']['stocks']['NIKKEI']['points'].toStringAsFixed(2),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: dadosFinanceiros['results']['stocks']['NIKKEI']['variation'] > 0 ? Colors.blue : Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      dadosFinanceiros['results']['stocks']['NIKKEI']['variation'].toStringAsFixed(2),
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bitcoin', arguments: dadosFinanceiros);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[900],
              ),
              child: const Text('Ir para BitCoin'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaginaBitcoin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic>? dadosFinanceiros= ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finanças de Hoje'),
        backgroundColor: Colors.green[900],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const Align(
              alignment: Alignment.center,
              child: Text('BitCoin', style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 30),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.black, 
                  width: 1)
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dadosFinanceiros!['results']['bitcoin']['blockchain_info']['name'].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    dadosFinanceiros['results']['bitcoin']['blockchain_info']['buy'] != null
                                      ? dadosFinanceiros['results']['bitcoin']['blockchain_info']['buy'].toStringAsFixed(2) : '0.00',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: dadosFinanceiros['results']['bitcoin']['blockchain_info']['variation'] > 0 ? Colors.blue : Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      dadosFinanceiros['results']['bitcoin']['blockchain_info']['variation'] != null 
                                        ? dadosFinanceiros['results']['bitcoin']['blockchain_info']['variation'].toStringAsFixed(3) ! : '0.000',
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dadosFinanceiros['results']['bitcoin']['coinbase']['name'].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    dadosFinanceiros['results']['bitcoin']['coinbase']['buy'] != null
                                      ? dadosFinanceiros['results']['bitcoin']['coinbase']['buy'].toStringAsFixed(2) : '0.00',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: dadosFinanceiros['results']['bitcoin']['coinbase']['variation'] > 0 ? Colors.blue : Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      dadosFinanceiros['results']['bitcoin']['coinbase']['variation'] != null 
                                        ? dadosFinanceiros['results']['bitcoin']['coinbase']['variation'].toStringAsFixed(3) ! : '0.000',
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dadosFinanceiros['results']['bitcoin']['bitstamp']['name'].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    dadosFinanceiros['results']['bitcoin']['bitstamp']['buy'] != null
                                      ? dadosFinanceiros['results']['bitcoin']['bitstamp']['buy'].toStringAsFixed(2) : '0.00',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: dadosFinanceiros['results']['bitcoin']['bitstamp']['variation'] > 0 ? Colors.blue : Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      dadosFinanceiros['results']['bitcoin']['bitstamp']['variation'] != null 
                                        ? dadosFinanceiros['results']['bitcoin']['bitstamp']['variation'].toStringAsFixed(3) ! : '0.000',
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dadosFinanceiros['results']['bitcoin']['foxbit']['name'].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    dadosFinanceiros['results']['bitcoin']['foxbit']['buy'] != null
                                      ? dadosFinanceiros['results']['bitcoin']['foxbit']['buy'].toStringAsFixed(2) : '0.00',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: dadosFinanceiros['results']['bitcoin']['foxbit']['variation'] > 0 ? Colors.blue : Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      dadosFinanceiros['results']['bitcoin']['foxbit']['variation'] != null 
                                        ? dadosFinanceiros['results']['bitcoin']['foxbit']['variation'].toStringAsFixed(3) ! : '0.000',
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dadosFinanceiros['results']['bitcoin']['mercadobitcoin']['name'].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    dadosFinanceiros['results']['bitcoin']['mercadobitcoin']['buy'] != null
                                      ? dadosFinanceiros['results']['bitcoin']['mercadobitcoin']['buy'].toStringAsFixed(2) : '0.00',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: dadosFinanceiros['results']['bitcoin']['mercadobitcoin']['variation'] > 0 ? Colors.blue : Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      dadosFinanceiros['results']['bitcoin']['mercadobitcoin']['variation'] != null 
                                        ? dadosFinanceiros['results']['bitcoin']['mercadobitcoin']['variation'].toStringAsFixed(3) ! : '0.000',
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[900],
              ),
              child: const Text('Página Principal'),
            ),
          ],
        ),
      ),
    );
  }
}