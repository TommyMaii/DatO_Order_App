import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/services.dart';
import 'package:protoorder/Alnabru.dart';
import 'package:protoorder/L%C3%B8ren.dart';
import 'package:protoorder/akerbrygge.dart';
import 'package:protoorder/ensj%C3%B8.dart';
import 'package:protoorder/lillestr%C3%B8m.dart';
import 'package:protoorder/str%C3%B8mmen.dart';

class BestillingSide extends StatefulWidget {
  const BestillingSide({super.key});

  @override
  State<BestillingSide> createState() => _BestillingsideState();
}

class _BestillingsideState extends State<BestillingSide> {
  @override
  List<String> attachments = [];
  bool isHTML = false;
  final _subjectController = TextEditingController(text: 'Bestilling fra DatO');
  final _recipientController =
      TextEditingController(text: 'johnny.htn@gmail.com');
  final _bodyController = TextEditingController(
    text: 'Sendt Bestilling fra DatO',
  );

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff003A3A),
        centerTitle: true,
        title: Text("DatO", style: TextStyle(color: Color(0xffFFE233))),
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
            Text(
              "  Bestillingsliste  ",
              style: TextStyle(color: Color(0xffFFE233)),
            ),
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
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side:
                              BorderSide(width: 2.0, color: Color(0xffFFE233)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3))),
                      onPressed: () {
                        _attachFileFromAppDocumentsDirectoy();
                        send();
                      },
                      child: Text(
                        "Send Bestilling",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xffFFE233)),
                      )),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  Future<void> _attachFileFromAppDocumentsDirectoy() async {
    try {
      final filePath = '/storage/emulated/0/Download/Bestilling_1.pdf';

      setState(() {
        attachments.add(filePath);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create file in applicion directory'),
        ),
      );
    }
  }
}
