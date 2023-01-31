import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  int counter = 0;
  var request = "https://api.hgbrasil.com/finance?key=b65dae79";

  TextEditingController valueController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String infoText = "Informe um valor";

  Future<void> increment() async {
    counter = counter + 1;
  }

  httpResquest() async {
    // http.Response response = await http.get(request);
    // log(response.body.toString());

    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url =
        Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<void> makeGetRequest() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    if (response.statusCode == 200) {
      // Se a chamada foi bem-sucedida, o JSON é decodificado
      var data = json.decode(response.body);
      print(data);
    } else {
      // Se a chamada não foi bem-sucedida, lançamos um erro
      throw Exception('Falha ao carregar dados');
    }
  }

  void _resetFields() {
    valueController.text = "";
    infoText = "Informe um valor";
    formKey = GlobalKey<FormState>();
  }
}
