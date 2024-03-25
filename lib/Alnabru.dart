import 'package:flutter/material.dart';
import 'package:protoorder/L%C3%B8ren.dart';
import 'package:protoorder/akerbrygge.dart';
import 'package:protoorder/ensj%C3%B8.dart';
import 'package:protoorder/lillestr%C3%B8m.dart';
import 'package:protoorder/orderpage.dart';
import 'package:protoorder/str%C3%B8mmen.dart';

class alnabru extends StatefulWidget {
  const alnabru({super.key});

  @override
  State<alnabru> createState() => alnabruState();
}

class alnabruState extends State<alnabru> {
  String _dropdownValue = "Alnabru";
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
          title: Text(
            "DatO",
            style: TextStyle(color: Color(0xffF7F7F7)),
          ),
        ),
        body: Container(
          color: Color(0xff003A3A),
          child: Column(children: [
            Row(children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                child: Divider(
                  color: Color(0xffFFE233),
                ),
              )),
              Text("  Bestillingsliste  ",
                  style: TextStyle(color: Color(0xffFFE233))),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Divider(
                  color: Color(0xffFFE233),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(children: [
                Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
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
            ),
            Expanded(
                child: Container(
              color: Color(0xffF7F7F7),
              child: IntrinsicHeight(
                  child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10.0, 3, 10, 3),
                            child: Container(
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ListTile(
                                        leading: Text(
                                          "2167675",
                                          style: TextStyle(
                                              color: Color(
                                                0xff003A3A,
                                              ),
                                              fontSize: 14),
                                        ),
                                        title: Text(
                                          "110MM ACO PIPE 110MM LÅSEBØJLE AISI304",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        trailing: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Color(0xff003A3A),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3))),
                                            onPressed: () {},
                                            child: Text(
                                              "20 stk",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xffF7F7F7)),
                                            )),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ])),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10.0, 3, 10, 3),
                            child: Container(
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ListTile(
                                        leading: Text(
                                          "2258412",
                                          style: TextStyle(
                                              color: Color(
                                                0xff003A3A,
                                              ),
                                              fontSize: 14),
                                        ),
                                        title: Text(
                                          "d110 Tilbakeslagskum base modular, 1x inn/utløp",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        trailing: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Color(0xff003A3A),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3))),
                                            onPressed: () {},
                                            child: Text(
                                              "20 stk",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xffF7F7F7)),
                                            )),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ])),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10.0, 3, 10, 3),
                            child: Container(
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ListTile(
                                        leading: Text(
                                          "2213483",
                                          style: TextStyle(
                                              color: Color(
                                                0xff003A3A,
                                              ),
                                              fontSize: 14),
                                        ),
                                        title: Text(
                                          "75mm 87,5° Master3Plus bend, langt PP, svart",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        trailing: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Color(0xff003A3A),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3))),
                                            onPressed: () {},
                                            child: Text(
                                              "20 stk",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xffF7F7F7)),
                                            )),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ])),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.94,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    width: 2.0, color: Color(0xff003A3A)),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => orderPage()));
                            },
                            child: Text(
                              "Legg til ny bestilling",
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xff003A3A)),
                            ))),
                  ),
                  Expanded(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width *
                                        0.94,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xff003A3A),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3))),
                                        onPressed: () {},
                                        child: Text(
                                          "Send Bestillingsliste",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xffFFE233)),
                                        ))),
                              )
                            ],
                          )))
                ],
              )),
            )),
          ]),
        ));
  }
}
