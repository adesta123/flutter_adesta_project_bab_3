import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  TextEditingController input = new TextEditingController();

  double kelvin = 0;
  double reamor = 0;
  double fahrenheit = 0;

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(input: input),
              Result(kelvin: kelvin, reamor: reamor, fahrenheit: fahrenheit),
              Container(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.redAccent)),
                  onPressed: () {
                    Convert();
                  },
                  child: Text('Konversi Suhu'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Convert() {
    return setState(() {
      double celcius = double.parse(input.text);
      kelvin = celcius + 273;
      reamor = celcius * 0.8;
      fahrenheit = (celcius * 1.8) + 32;
    });
  }
}

class Result extends StatelessWidget {
  const Result({
    super.key,
    required this.kelvin,
    required this.reamor,
    required this.fahrenheit,
  });

  final double kelvin;
  final double reamor;
  final double fahrenheit;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 100,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(
                      "Suhu dalam Kelvin",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    child: Text("$kelvin",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  )
                ]),
          ),
          Container(
            height: 100,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text("Suhu dalam Reamor",
                        style: TextStyle(fontSize: 12)),
                  ),
                  Container(
                    child: Text("$reamor",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  )
                ]),
          ),
          Container(
            height: 100,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text("Suhu dalam Fahrenheit",
                        style: TextStyle(fontSize: 12)),
                  ),
                  Container(
                    child: Text("$fahrenheit",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.input,
  });

  final TextEditingController input;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: input,
        keyboardType: const TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          hintText: "Masukkan Suhu Dalam Celcius",
        ),
      ),
    );
  }
}