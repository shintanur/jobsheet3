import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller1 = TextEditingController();
  double C = 0;
  double K = 0;
  double R = 0;

  void Convert() {
    setState(() {
      double C = double.parse(controller1.text);
      R = 0.8 * C;
      K = C + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jobsheet Pertemuan 2",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Konverter Suhu'),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Input(controller1: controller1),
              SizedBox(
                height: 100,
                width: 100,
              ),
              Result(),
              Result1(K: K, R: R),
              SizedBox(
                height: 200,
                width: 250,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: Convert,
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  child: Text('Konversi Suhu'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.controller1,
  }) : super(key: key);

  final TextEditingController controller1;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller1,
      decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Masukkan Suhu Dalam Celcius'),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}

class Result1 extends StatelessWidget {
  const Result1({
    Key? key,
    required this.K,
    required this.R,
  }) : super(key: key);

  final double K;
  final double R;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$K', style: TextStyle(fontSize: 30)),
        SizedBox(
          width: 300,
          height: 100,
        ),
        Text('$R', style: TextStyle(fontSize: 30))
      ],
    );
  }
}

class Result extends StatelessWidget {
  const Result({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('Suhu dalam Kelvin'),
        SizedBox(
          width: 200,
        ),
        Text('Suhu dalam Reamur'),
      ],
    );
  }
}