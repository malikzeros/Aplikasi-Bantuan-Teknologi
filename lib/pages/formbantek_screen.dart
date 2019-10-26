import 'package:flutter/material.dart';
import 'package:bantek/bantek.dart';
import 'package:bantek/widgets/walkthrough.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:bantek/widgets/datetime_picker_formfield.dart';
import 'package:bantek/widgets/flutter_search_panel.dart';
import 'package:bantek/widgets/search_item.dart';
import 'package:bantek/widgets/search_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController departure_date = TextEditingController();
TextEditingController return_date = TextEditingController();
String type_of_bantek;
int fromdeparture, todeparture;

class FormBantek extends StatefulWidget {
  static String tag = 'FormBantek-page';
  @override
  _FormBantekState createState() => new _FormBantekState();
}

class _FormBantekState extends State<FormBantek> {
  // List<SearchItem<int>> searchpanel;
  var content;
  String dropdownValue;
  final format = DateFormat("yyyy-MM-dd");
  List data = List(); //edited line
  final String url_airport = Bantek.url_airport;
  Future getdata() async {
    var response = await http.get(Uri.encodeFull(url_airport),
        headers: {'accept': 'application/json'});
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    content = json.decode(response.body);
    print(content.length);
    setState(() {
      // searchpanel.addAll(content);
    });
  }

  @override
  void initState() {
    super.initState();
    this.getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.blue, title: Text("Form Bantek")),
        body: Center(
          child: Form(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                Card(
                  color: Colors.grey[200],
                  child: Column(
                    children: <Widget>[
                      Card(
                        color: Colors.grey[200],
                        child: ListTile(
                          leading: new CircleAvatar(backgroundImage: AssetImage('assets/icon.png')),
                          title: Text("Departing From",style: TextStyle(color: Colors.green),),
                          subtitle: Text("CGK Jakarta",style: TextStyle(color: Colors.blue),),
                          onTap: (){
                            Bantek.goToListAircraft(context);
                          },
                        ),
                      ),
                      Card(
                        color: Colors.grey[200],
                        child: ListTile(
                          leading: new CircleAvatar(backgroundImage: AssetImage('assets/icon.png')),
                          title: Text("Flying To",style: TextStyle(color: Colors.green),),
                          subtitle: Text("DPS Denpasar",style: TextStyle(color: Colors.blue),),
                          onTap: (){
                            Bantek.goToListAircraft(context);
                          },
                        ),
                      ),
                      Card(
                        color: Colors.grey[200],
                        child: ListTile(
                          leading: new CircleAvatar(backgroundImage: AssetImage('assets/icon.png')),
                          title: Text("Flying To (For Transit)",style: TextStyle(color: Colors.green),),
                          subtitle: Text("DPS Denpasar",style: TextStyle(color: Colors.blue),),
                          onTap: (){
                            Bantek.goToListAircraft(context);
                          },
                        ),
                      ),
                      Card(
                        color: Colors.grey[200],
                        child: ListTile(
                          leading: new CircleAvatar(backgroundImage: AssetImage('assets/icon.png')),
                          title: Text("Flying To (For Transit)",style: TextStyle(color: Colors.green),),
                          subtitle: Text("DPS Denpasar",style: TextStyle(color: Colors.blue),),
                          onTap: (){
                            Bantek.goToListAircraft(context);
                          },
                        ),
                      ),
                      Card(
                        color: Colors.grey[200],
                        child: ListTile(
                          leading: new CircleAvatar(backgroundImage: AssetImage('assets/icon.png')),
                          title: Text("Flying To (For Transit)",style: TextStyle(color: Colors.green),),
                          subtitle: Text("DPS Denpasar",style: TextStyle(color: Colors.blue),),
                          onTap: (){
                            Bantek.goToListAircraft(context);
                          },
                        ),
                      ),
                      Card(
                        color: Colors.grey[200],
                        child: ListTile(
                          leading: new CircleAvatar(backgroundImage: AssetImage('assets/icon.png')),
                          title: Text("Flying To (For Transit)",style: TextStyle(color: Colors.green),),
                          subtitle: Text("DPS Denpasar",style: TextStyle(color: Colors.blue),),
                          onTap: (){
                            Bantek.goToListAircraft(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                DateTimeField(
                  controller: departure_date,
                  decoration: InputDecoration(
                    hintText: 'Departure Date',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                  format: format,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                ),
                SizedBox(height: 20.0),
                DateTimeField(
                  controller: return_date,
                  decoration: InputDecoration(
                    hintText: 'Return Date',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                  format: format,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                ),
                SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.0),
                      border: Border.all(color: Colors.grey)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      hint: Text("Type of Bantek EOB/DETASERING"),
                      isExpanded: false,
                      items: <String>['EOB', 'DETASERING'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        type_of_bantek = value;
                        setState(() {
                          dropdownValue = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 48.0),
                RaisedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    String name = prefs.getString('name');
                    String id = prefs.getString('id');
                    String division = prefs.getString('division');
                    http.post(Bantek.url_submit_form, body: {
                      'id': id,
                      'name': name,
                      'division': division,
                      'departure_date': departure_date.text,
                      'return_date': return_date.text,
                      'from': fromdeparture.toString(),
                      'to': todeparture.toString(),
                      'type_of_bantek': type_of_bantek,
                    }).then((res) {
                      print(res.statusCode);
                      print(res.body);
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("Input Success"),
                          );
                        },
                      );
                      //Bantek.goToHomeUser(context);
                    }).catchError((err) {
                      print(err);
                    });
                  },
                  child: Text('SUBMIT DATA'),
                )
              ],
            ),
          ),
        ));
  }
}
