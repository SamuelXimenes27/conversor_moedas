import 'package:conversormoedas/app/modules/shared/widgets/textfield.dart';
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
              CustomTextField(
                titleInput: 'Reais',
                colorTitleInput: Color(0xfff74c06),
                fontSizeTitle: 22,
                controller: store.realController,
                onChanged: (value) {
                  double newDolarValue =
                      double.parse(value!) / store.dolarValue;
                  double newEuroValue = double.parse(value) / store.euroValue;

                  // store.realController.text = 'R\$ $value';

                  store.dolarController.text =
                      '${newDolarValue.toStringAsPrecision(2)}';

                  store.euroController.text =
                      '${newEuroValue.toStringAsPrecision(2)}';
                },
              ),
              CustomTextField(
                titleInput: 'Dólares',
                colorTitleInput: Color(0xfff74c06),
                fontSizeTitle: 22,
                controller: store.dolarController,
                onChanged: (value) {
                  double newRealValue = double.parse(value!) * store.dolarValue;
                  double newEuroValue = double.parse(value) / store.euroValue;

                  // store.dolarController.text = '\$ $value';

                  store.realController.text =
                      '${newRealValue.toStringAsPrecision(2)}';

                  store.euroController.text =
                      '${newEuroValue.toStringAsPrecision(2)}';
                },
              ),
              CustomTextField(
                titleInput: 'Euros',
                colorTitleInput: Color(0xfff74c06),
                fontSizeTitle: 22,
                controller: store.euroController,
                onChanged: (value) {
                  double newRealValue = double.parse(value!) * store.euroValue;
                  double newDolarValue = double.parse(value) / store.dolarValue;

                  // store.euroController.text = '€ $value';

                  store.realController.text =
                      '${newRealValue.toStringAsPrecision(2)}';

                  store.dolarController.text =
                      '${newDolarValue.toStringAsPrecision(2)}';
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
          onPressed: () {
            store.resetFields();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
