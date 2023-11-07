import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  buscaDadosApi() async {
    const String url =
        'https://api.hgbrasil.com/finance?format=json-cors&key=2f4dec15';

    Response resposta = await get(Uri.parse(url));
    Map dados = json.decode(resposta.body);
    print(dados);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
