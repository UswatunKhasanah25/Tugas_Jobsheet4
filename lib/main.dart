import 'package:flutter/material.dart';

import 'widgets/input.dart';
import 'widgets/result.dart';
import 'widgets/convert.dart';
import 'widgets/dropdownKonversi.dart';
import 'widgets/riwayatKonversi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  double inputUser = 0;
  double kelvin = 0;
  double reamur = 0;
  var listItem = [
     "Kelvin",
      "Reamur"
  ];
  final inputController = TextEditingController();
  String newValue = "Kelvin";
  double result = 0;
  List<String> listViewItem = List<String>();
  
  void _konversiSuhu() {
    setState(() {
      final inputUser = double.parse(inputController.text);
      if (newValue == "Kelvin") {
        result = inputUser + 273;
        listViewItem.add("Kelvin: "+ '$result');
      } 
      else {
        result = (4 / 5) * inputUser;
        listViewItem.add("Reamur: "+ '$result');
      }
    });
  }
  void dropdownOnChanged(String changeValue){
    setState(() {
      newValue = changeValue;
      _konversiSuhu();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold (
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Input(inputController: inputController),
                DropdownKonversi(listItem: listItem, newValue: newValue, dropdownOnChanged: dropdownOnChanged, konversiSuhu: _konversiSuhu),
                Result(result: result,),
                Convert(konvertHandler: _konversiSuhu),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "Riwayat Konversi",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                  child: RiwayatKonversi(listViewItem: listViewItem)
                ),
              ],
            ),
        ),
      ),
    );
  }
}

