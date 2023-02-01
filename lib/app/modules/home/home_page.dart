import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../shared/widgets/appbar.dart';
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: size,
        child: CustomAppBar(
          title: 'Conversor de Moeda',
          upperTitle: 'Current Conversor',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: store.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.monetization_on,
                size: 120.0,
                color: Color(0xfff6921f),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Reais",
                    labelStyle: TextStyle(
                      color: Color(0xff4d130a),
                    ),
                    hintText: '',
                    hintStyle: TextStyle(color: Colors.black)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xffdb36), fontSize: 25.0),
                controller: store.realController,
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
                    labelStyle: TextStyle(color: Color(0xff4d130a))),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xffdb36), fontSize: 25.0),
                controller: store.dolarController,
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
                    labelStyle: TextStyle(color: Color(0xff4d130a))),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xffdb36), fontSize: 25.0),
                controller: store.euroController,
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
      floatingActionButton: Ink(
        width: 48.0,
        height: 48.0,
        decoration: ShapeDecoration(
          color: Color(0xfff6921f),
          shape:
              const CircleBorder(side: BorderSide(color: Colors.transparent)),
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 48.0 / 2,
          iconSize: 48.0 / 2,
          icon: Icon(Icons.refresh, color: Colors.white),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
