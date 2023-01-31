import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
    store.makeGetRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversor de Moeda"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              store.resetFields();
            },
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: store.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(
                Icons.monetization_on,
                size: 120.0,
                color: Colors.amber,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Reais",
                    labelStyle: TextStyle(color: Colors.amber)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 25.0),
                controller: store.realController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Insira um valor.";
                  }
                },
                onChanged: (value) {
                  double newDolarValue = double.parse(value) / store.dolarValue;
                  double newEuroValue = double.parse(value) / store.euroValue;

                  store.dolarController.text =
                      newDolarValue.toStringAsPrecision(2);
                  store.euroController.text =
                      newEuroValue.toStringAsPrecision(2);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Dólares",
                    labelStyle: TextStyle(color: Colors.amber)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.amber, fontSize: 25.0),
                controller: store.dolarController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Insira um valor.";
                  }
                },
                onChanged: (value) {
                  double newRealValue = double.parse(value) * store.dolarValue;
                  double newEuroValue = double.parse(value) / store.euroValue;

                  store.realController.text =
                      newRealValue.toStringAsPrecision(2);
                  store.euroController.text =
                      newEuroValue.toStringAsPrecision(2);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Euros",
                    labelStyle: TextStyle(color: Colors.amber)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.amber, fontSize: 25.0),
                controller: store.euroController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Insira um valor.";
                  }
                },
                onChanged: (value) {
                  double newRealValue = double.parse(value) * store.euroValue;
                  double newDolarValue = double.parse(value) / store.dolarValue;

                  store.realController.text =
                      newRealValue.toStringAsPrecision(2);
                  store.dolarController.text =
                      newDolarValue.toStringAsPrecision(2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
