import 'package:flutter/material.dart';
//import 'package:async/async.dart';


const request = "https://api.hgbrasil.com/finance?key=b65dae79";

void main() async {

//   http.Response response = await http.get(request);
//   print(response.body);

  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController valueController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe um valor";

  void _resetFields() {
    valueController.text = "";
    setState(() {
      _infoText = "Informe um valor";
      _formKey = GlobalKey <FormState>();
    });
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
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
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
                style: const TextStyle(color: Colors.amber, fontSize: 25.0),
                controller: valueController,
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Insira um valor.";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Dólares",
                    labelStyle: TextStyle(color: Colors.amber)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.amber, fontSize: 25.0),
                controller: valueController,
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Insira um valor.";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Euros",
                    labelStyle: TextStyle(color: Colors.amber)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.amber, fontSize: 25.0),
                controller: valueController,
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Insira um valor.";
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
