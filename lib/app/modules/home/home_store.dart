import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  TextEditingController realController = TextEditingController();

  @observable
  TextEditingController dolarController = TextEditingController();

  @observable
  TextEditingController euroController = TextEditingController();

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  String infoText = "Informe um valor";

  @observable
  double dolarValue = 0;

  @observable
  double euroValue = 0;

  @action
  Future<void> makeGetRequest() async {
    final response = await http
        .get(Uri.parse('https://api.hgbrasil.com/finance?key=b65dae79'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      dolarValue = data['results']['currencies']['USD']['buy'];
      euroValue = data['results']['currencies']['EUR']['buy'];
    } else {
      throw Exception('Falha ao carregar dados');
    }
  }

  @action
  void resetFields() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
    infoText = "Informe um valor";
    formKey = GlobalKey<FormState>();
  }

  @action
  void clearInputs() {
    realController.clear();
    euroController.clear();
    dolarController.clear();
  }
}
