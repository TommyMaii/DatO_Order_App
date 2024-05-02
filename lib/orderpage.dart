import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:protoorder/L%C3%B8ren.dart';
import 'package:protoorder/akerbrygge.dart';
import 'package:protoorder/ensj%C3%B8.dart';
import 'package:protoorder/lillestr%C3%B8m.dart';
import 'package:protoorder/str%C3%B8mmen.dart';
import 'dart:convert';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:open_document/open_document.dart';
import 'bestillingside.dart';

class orderPage extends StatefulWidget {
  orderPage({super.key});

  @override
  State<orderPage> createState() => _orderPageState();
}

class produktene {
  String nrf;
  String navn;

  produktene({required this.nrf, required this.navn});

  factory produktene.fromJson(Map<String, dynamic> json) {
    return produktene(nrf: json["NRF"], navn: json["Navn"]);
  }
}

class _orderPageState extends State<orderPage> {
  bool showDropDown = false;
  String _dropdownValue = "Alnabru";
  String Day = '12';
  String Month = 'Februar';
  String Year = '2024';
  List produkter = [];
  int number = 1;
  String valgtProdukt = "";
  List<produktene> _produktene = [];
  String produktNRF = "2258412";
  String produktNavn = "Velg Produkt";
  List<String> ValgteProdukter = [];

  final String produktListe =
      '[{"NRF":"2258412","Navn": "d110 Tilbakeslagskum base modular 1x inn/utløp"},{"NRF": "2258413", "Navn": "d125 Tilbakeslagskum base modular 1x inn/utløp"}, {"NRF": "2258414", "Navn": "d160 Tilbakeslagskum base modular 1x inn/utløp"}, {"NRF": "2258415", "Navn": "d110 Tilbakeslagskum base modular 3x inn/ 1x utløp"}, {"NRF": "2258416", "Navn": "d125 Tilbakeslagskum base modular 3x inn/ 1x utløp"}, {"NRF": "2258417", "Navn": "d160 Tilbakeslagskum base modular 3x inn/ 1x utløp"}, {"NRF": "2258418", "Navn": "Ø110-200 SWA kit 2x klaffer fritthengende"}, {"NRF": "2258419", "Navn": "Ø110-200 FKA kit 2 klaffermotorsensorkontr.panel"}, {"NRF": "2258421", "Navn": "Ø110-200 Pumpfix F kit 2 klaffer&sensorpumpe,motorkontr"}, {"NRF": "3417926", "Navn": "ACO Civicline CL 100 10.0 1 METER"}, {"NRF": "3417927", "Navn": "ACO Civicline CL 100 10.1 0,5 METER MED KNOCKOUT"}, {"NRF": "3417928", "Navn": "Xtradrain Sandfang 0,5 METER"}, {"NRF": "3411087", "Navn": "Rektangulær avløpsrist i rustfritt stål for Frame. Mål: 129x129 mm Antall silhull: 12"}, {"NRF": "2167669", "Navn": "110MM ACO PIPE 110MM DRENERINGSPLUGG AISI304 / EN1.4301 EDPM"}, {"NRF": "2167671", "Navn": "125MM ACO PIPE 125MM DRENERINGSPLUGG AISI304 / EN1.4301 EDPM"}, {"NRF": "2167672", "Navn": "160MM ACO PIPE 160MM DRENERINGSPLUGG AISI304 / EN1.4301 EDPM"}, {"NRF": "2167673", "Navn": "50MM ACO PIPE 50MM LÅSEBØJLE AISI304 / EN1.4301 EDPM"}, {"NRF": "2167674", "Navn": "75MM ACO PIPE 75MM LÅSEBØJLE AISI304 / EN1.4301 EDPM"}, {"NRF": "2167675", "Navn": "110MM ACO PIPE 110MM LÅSEBØJLE AISI304 / EN1.4301 EDPM"}, {"NRF": "2167676", "Navn": "50-110MM ACO PIPE ELEKTRISK RØRKUTTER"}, {"NRF": "2167677", "Navn": "160-250MM ACO PIPE RØRKUTTER"}, {"NRF": "2167678", "Navn": "160MM ACO PIPE RØRHOLDER"}, {"NRF": "2167679", "Navn": "200MM ACO PIPE RØRHOLDER"}, {"NRF": "2167681", "Navn": "75MM ACO PIPE 50MM HJØRNEGRENRØR DOBBELT 45° AISI304 / EN1.4301 EPDM"}, {"NRF": "2167682", "Navn": "40MM ACO PIPE 40MM RØRKLAMMER MED GUMMI AISI316 / EN1.4404 EPDM"}, {"NRF": "2167683", "Navn": "125MM ACO PIPE 125MM RØRKLAMMER MED GUMMI GALV"}, {"NRF": "2167684", "Navn": "250MM ACO PIPE 250MM RØRKLAMMER MED GUMMI AISI316 / EN1.4404 EPDM"}, {"NRF": "2167685", "Navn": "315MM ACO PIPE 315MM RØRKLAMMER MED GUMMI AISI316 / EN1.4404 EPDM"}, {"NRF": "2167686", "Navn": "40MM ACO PIPE 40MM PAKNING NBR"}, {"NRF": "2167687", "Navn": "125MM ACO PIPE 125MM PAKNING NBR"}, {"NRF": "2167688", "Navn": "DN150/160MM ACO PIPE 150x160MM GUMMIOVRG RF TIL BTG RØR EPDM"}, {"NRF": "2167689", "Navn": "DN70/75MM ACO PIPE 70x75MM GUMMIOVRG RF TIL BTG RØR EPDM"}, {"NRF": "2167691", "Navn": "40MM ACO PIPE 40MM LÅSEBØJLE DOBBEL AISI304 / EN1.4301"}, {"NRF": "2167692", "Navn": "125MM ACO PIPE 125MM LÅSEBØJLE DOBBEL AISI304 / EN1.4301"}, {"NRF": "2167693", "Navn": "160MM ACO PIPE 160MM LÅSEBØJLE DOBBEL AISI304 / EN1.4301"}, {"NRF": "2167694", "Navn": "315MM ACO PIPE 315MM LÅSEBØJLE DOBBEL AISI304 / EN1.4301"}, {"NRF": "2167695", "Navn": "40MM ACO PIPE 50MM RØRKLAMMER MED GUMMI/EKSP.SBOLT AISI316 / EN1.4404"}, {"NRF": "2167696", "Navn": "40MM ACO PIPE GJENNOMFØRING R1B AISI316 / EN1.4404"}, {"NRF": "2167697", "Navn": "50MM ACO PIPE GJENNOMFØRING R1B AISI316 / EN1.4404"}, {"NRF": "2167698", "Navn": "75MM ACO PIPE GJENNOMFØRING R1B AISI316 / EN1.4404"}, {"NRF": "2167699", "Navn": "110MM ACO PIPE GJENNOMFØRING R1B AISI316 / EN1.4404"}, {"NRF": "2213482", "Navn": "50mm x 40mm Master3Plus eks. overgang PP, svart"}, {"NRF": "2213483", "Navn": "75mm 87,5° Master3Plus bend, langt PP, svart"}, {"NRF": "2213484", "Navn": "110mm 87,5° Master3Plus bend, langt PP, svart"}, {"NRF": "2213485", "Navn": "75mm 87,5° Master3Plus bend, langt, allmuffe PP, svart"}, {"NRF": "2213486", "Navn": "110mm 87,5° Master3Plus bend, langt, allmuffe PP, svart"}, {"NRF": "2251611", "Navn": "800/6000 DV Rør ID SN8"}, {"NRF": "2251612", "Navn": "600/6000 DV Rør ID SN8"}, {"NRF": "2251625", "Navn": "160 Tilbakeslagsventil Pestan"}, {"NRF": "2251626", "Navn": "200 Tilbakeslagsventil KGRE Pestan"}]';
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

  var length = 1;

  var years = ['2024', '2025', '2026', '2027', '2028', '2029', '2030', '2031'];

  var shownCards = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('products.json');
    final data = await json.decode(response);
    setState(() {
      produkter = data["produkter"];
    });
  }

  // readJson2() {
  //  var json = JsonDecoder().convert(produktListe);
  // _produktene = (json).map<produktene>((data5) {
  //    return (produktene.fromJson(data5)) as List;
  //  }).toList();

  //  produktNRF = _produktene[0].nrf;
  // }

  readJson3() async {
    final json = await JsonDecoder().convert(produktListe);
    _produktene = await (json)
        .map<produktene>((item) => produktene.fromJson(item))
        .toList();
    produktNRF = _produktene[0].nrf;
    produktNavn = _produktene[0].navn;
  }

  Future<Uint8List> createPDFFile() async {
    final pdf = pw.Document();
    final image = (await rootBundle.load("dato.jpg")).buffer.asUint8List();
    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Column(children: [
          pw.Image(pw.MemoryImage(image),
              width: 150, height: 150, fit: pw.BoxFit.cover),
          pw.Text(produktNRF + produktNavn + ' 20stk')
        ]);
      },
    ));
    return pdf.save();
  }

  Future<void> saveFile(String filename, Uint8List byteList) async {
    final output = "/storage/emulated/0/Download/";
    var filePath = "/storage/emulated/0/Download/$filename.pdf";
    final file = File(filePath);
    await file.writeAsBytes(byteList);
  }

  Widget orderButton() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.94,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2.0, color: Color(0xff003A3A)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3))),
              onPressed: () {
                showDropDown = true;
              },
              child: Text(
                "Legg til ny bestilling",
                style: TextStyle(fontSize: 15, color: Color(0xff003A3A)),
              ))),
    );
  }

  Widget dropDown() {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Container(
            height: 45,
            color: Color(0xff003A3A),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 1.77,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Colors.white),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: produktNavn,
                            items: _produktene.map((produktene map) {
                              return DropdownMenuItem<String>(
                                  value: map.navn,
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5.0, 0, 0, 0),
                                      child: Container(
                                          height: 45,
                                          child: Center(
                                            child: Text(
                                                map.nrf + ' ' + map.navn,
                                                style: TextStyle(
                                                  leadingDistribution:
                                                      TextLeadingDistribution
                                                          .even,
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  overflow: TextOverflow.fade,
                                                )),
                                          ))));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                produktNavn = newValue!;
                              });
                              print(produktNRF);
                            },
                            borderRadius: BorderRadius.circular(10),
                            underline: Container(),
                          )),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width / 6,
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
                                produktNRF = newValue!;
                              });
                            },
                            value: Day,
                            borderRadius: BorderRadius.circular(10),
                            underline: Container(),
                          )),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 13, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 18,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          size: 12,
                          color: Color(0xffFFE233),
                        )),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 10,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          produkter[length - 1] = length++;
                        });
                      },
                      child: Icon(
                        Icons.done,
                        color: Color(0xff003A3A),
                      ),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffFFE233)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)))),
                    ))
              ],
            )));
  }

  void initState() {
    super.initState();

    readJson();
    // readJson2();
    readJson3();
    createPDFFile();
  }

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
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        LimitedBox(
                          maxHeight: MediaQuery.of(context).size.height * 0.6,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: produkter.length < length
                                ? produkter.length
                                : length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ListTile(
                                          leading: Text(
                                            produkter[6]["NRF"]
                                                .toString(), //VALGEPRODUKTER
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color(
                                                  0xff003A3A,
                                                ),
                                                fontSize: 14),
                                          ),
                                          title: Text(
                                            produkter[6]["Navn"].toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 10,
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
                              );
                            },
                          ),
                        ),
                        Container(
                          child: showDropDown ? orderButton() : dropDown(),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.94,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Color(0xff003A3A),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3))),
                                              onPressed: () async {
                                                final data =
                                                    await createPDFFile();
                                                saveFile(
                                                    "bestilling_$number", data);
                                                number++;
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            BestillingSide()));
                                              },
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
                    ),
                  )),
            ),
          ]),
        ));
  }
}
