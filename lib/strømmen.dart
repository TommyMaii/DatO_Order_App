import 'package:flutter/material.dart';
import 'package:protoorder/L%C3%B8ren.dart';
import 'package:protoorder/akerbrygge.dart';
import 'package:protoorder/ensj%C3%B8.dart';
import 'package:protoorder/lillestr%C3%B8m.dart';
import 'package:protoorder/str%C3%B8mmen.dart';

class strommen extends StatefulWidget {
  const strommen({super.key});

  @override
  State<strommen> createState() => _strommenState();
}

class _strommenState extends State<strommen> {
  String _dropdownValue = "Strømmen";
  String Day = '12';
  String Month = 'Februar';
  String Year = '2024';

  var _items = [
    'AkerBrygge',
    'Løren',
    'Ensjø',
    'Lillestrøm',
    'Strømmen',
    'Alnabru'
  ];

  var days = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31'
  ];

  var months = [
    'Januar',
    'Februar',
    'Mars',
    'April',
    'Mai',
    'Juni',
    'Juli',
    'August',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  var years = ['2024', '2025', '2026', '2027', '2028', '2029', '2030', '2031'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff003A3A),
          centerTitle: true,
          title: Text("DatO"),
        ),
        body: Container(
          color: Color(0xff003A3A),
          child: Column(children: [
            Row(children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                child: Divider(
                  color: Colors.black,
                ),
              )),
              Text("  Bestillingsliste  "),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Divider(
                  color: Colors.black,
                ),
              )),
            ]),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(13.0, 0, 5, 0),
                  child: Icon(
                    Icons.circle,
                    color: Colors.yellow,
                  ),
                ),
                Text(
                  "Johnny Nguyen",
                  style: TextStyle(fontSize: 10, color: Colors.white),
                )
              ],
            ),
            Row(children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.white),
                        child: DropdownButton(
                          hint: Text("Velg Prosjekt"),
                          isExpanded: true,
                          items: _items.map((String item) {
                            return DropdownMenuItem(
                                value: item,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                                  child: Text(item,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                ));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _dropdownValue = newValue!;
                              if (_dropdownValue == 'AkerBrygge') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => akerbrygge()));
                              }
                              if (_dropdownValue == 'Løren') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => loren()));
                              }
                              if (_dropdownValue == 'Ensjø') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ensjo()));
                              }
                              if (_dropdownValue == 'Lillestrøm') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => lillestrom()));
                              }
                              if (_dropdownValue == 'Strømmen') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => strommen()));
                              }
                            });
                          },
                          value: _dropdownValue,
                          borderRadius: BorderRadius.circular(10),
                          underline: Container(),
                        )),
                  ))
            ]),
            Row(children: [
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.white),
                        child: DropdownButton(
                          hint: Text("Dag"),
                          isExpanded: true,
                          items: days.map((String item) {
                            return DropdownMenuItem(
                                value: item,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                                  child: Text(item,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                ));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              Day = newValue!;
                            });
                          },
                          value: Day,
                          borderRadius: BorderRadius.circular(10),
                          underline: Container(),
                        )),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.white),
                        child: DropdownButton(
                          hint: Text("Måned"),
                          isExpanded: true,
                          items: months.map((String item) {
                            return DropdownMenuItem(
                                value: item,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                                  child: Text(item,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                ));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              Month = newValue!;
                            });
                          },
                          value: Month,
                          borderRadius: BorderRadius.circular(10),
                          underline: Container(),
                        )),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.white),
                        child: DropdownButton(
                          hint: Text("År"),
                          isExpanded: true,
                          items: years.map((String item) {
                            return DropdownMenuItem(
                                value: item,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                                  child: Text(item,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                ));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              Year = newValue!;
                            });
                          },
                          value: Year,
                          borderRadius: BorderRadius.circular(10),
                          underline: Container(),
                        )),
                  ))
            ]),
          ]),
        ));
  }
}
