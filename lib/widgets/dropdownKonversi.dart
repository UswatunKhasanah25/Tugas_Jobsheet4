import 'package:flutter/material.dart';

class DropdownKonversi extends StatelessWidget {
  const DropdownKonversi({
    Key key,
    @required this.listItem,
    @required String newValue,
    @required this.dropdownOnChanged, this.konversiSuhu,
  }) : newValue = newValue, super(key: key);

  final List<String> listItem;
  final String newValue;
  final Function dropdownOnChanged;
  final Function konversiSuhu;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items:
      listItem.map((String value){
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),);
      }).toList(),
        value: newValue,
        onChanged: dropdownOnChanged,
        onTap: konversiSuhu,
    );
  }
}