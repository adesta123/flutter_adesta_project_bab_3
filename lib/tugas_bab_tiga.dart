import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController suhu = new TextEditingController();
  //variabel berubah

  double inputUser = 0;
  double kelvin = 0;
  double reamur = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Konverter Suhu",
            style: TextStyle(
              color: Colors.white
            ),
          ),
          backgroundColor: Colors.greenAccent,
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Container(
            child: ListView(
              children: [
                TextFormField(
                  // onChanged: (suhu){
                  // UpdateText(suhu);
                  // },
                  controller: suhu,
                  keyboardType: TextInputType.number, //khusus angka
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Masukkan Suhu dalam Celcius',
                  ),
                ),
                // Mengatur Suhu Kelvin
                Container(
                  margin: const  EdgeInsets.only(top: 230),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        padding: const EdgeInsets.only(top: 25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1,
                            ),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "Suhu Kelvin",
                              style: TextStyle(fontSize: 20),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "$kelvin",
                                  style: const TextStyle(fontSize: 40),
                                ),
                            ),
                          ],
                        ),
                      ),
                      // Mengatur Suhu Reamur
                      Container(
                        width: 150,
                        height: 150,
                        padding: const EdgeInsets.only(top: 25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1,
                            ),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "Suhu Reamur",
                              style: TextStyle(fontSize: 20),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "$reamur",
                                  style: const TextStyle(fontSize: 40),
                                ),    
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 270),
                  width: 1000,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 15, 161, 71), // background
                      foregroundColor: Colors.white, // foreground
                    ),
                    onPressed: () {
                      setState(() {
                        inputUser = double.parse(suhu.text);
                        kelvin = inputUser + 273.15;
                        reamur = 4 / 5 * inputUser;
                        }
                      );
                    },
                    child: const Text('Konversi suhu'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}