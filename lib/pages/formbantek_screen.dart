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
String listfromname,listfromcode,listfromlocation;
String listtoname,listtocode,listtolocation;
String listtransit1name,listtransit1code,listtransit1location;
String listtransit2name,listtransit2code,listtransit2location;
String listtransit3name,listtransit3code,listtransit3location;
String listtransit4name,listtransit4code,listtransit4location;
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      listfromname= prefs.getString('listfromname');
      listfromcode= prefs.getString('listfromcode');
      listfromlocation= prefs.getString('listfromlocation');
      listtoname= prefs.getString('listtoname');
      listtocode= prefs.getString('listtocode');
      listtolocation= prefs.getString('listtolocation');
      listtransit1name= prefs.getString('listtransit1name');
      listtransit1code= prefs.getString('listtransit1code');
      listtransit1location= prefs.getString('listtransit1location');
      listtransit2name= prefs.getString('listtransit2name');
      listtransit2code= prefs.getString('listtransit2code');
      listtransit2location= prefs.getString('listtransit2location');
      listtransit3name= prefs.getString('listtransit3name');
      listtransit3code= prefs.getString('listtransit3code');
      listtransit3location= prefs.getString('listtransit3location');
      listtransit4name= prefs.getString('listtransit4name');
      listtransit4code= prefs.getString('listtransit4code');
      listtransit4location= prefs.getString('listtransit4location');
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
                      SizedBox(
                        width: 150,
                        child: Text("From",textAlign: TextAlign.left ,style: TextStyle(color: Colors.green)),),
                      Card(
                        color: Colors.grey[200],
                        child: ListTile(
                          leading: new CircleAvatar(
                              backgroundImage: AssetImage('assets/icon.png')),
                          title: listfromname == null? Text(
                            "Airport",
                            style: TextStyle(color: Colors.green),
                          ): Text(
                            listfromname+' '+listfromcode,
                            style: TextStyle(color: Colors.green),
                          ),
                          subtitle: listfromname == null? Text(
                            "Location",
                            style: TextStyle(color: Colors.blue),
                          ): Text(
                            listfromlocation,
                            style: TextStyle(color: Colors.blue),
                          ),
                          onTap: () {
                            Bantek.goToListAircraftFrom(context);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: Text("To",style: TextStyle(color: Colors.green)),
                      ) ,
                      Card(
                        color: Colors.grey[200],
                        child: ListTile(
                          leading: new CircleAvatar(
                              backgroundImage: AssetImage('assets/icon.png')),
                          title: listtoname == null? Text(
                            "Airport",
                            style: TextStyle(color: Colors.green),
                          ): Text(
                            listtoname+' '+listtocode,
                            style: TextStyle(color: Colors.green),
                          ),
                          subtitle: listtoname == null? Text(
                            "Location",
                            style: TextStyle(color: Colors.blue),
                          ): Text(
                            listtolocation,
                            style: TextStyle(color: Colors.blue),
                          ),
                          onTap: () {
                            Bantek.goToListAircraftTo(context);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: Text("Transit",style: TextStyle(color: Colors.green)),
                      ) ,
                      Card(
                        color: Colors.grey[200],
                        child: ListTile(
                          leading: new CircleAvatar(
                              backgroundImage: AssetImage('assets/icon.png')),
                          title: listtransit1name == null? Text(
                            "Airport",
                            style: TextStyle(color: Colors.green),
                          ): Text(
                            listtransit1name+' '+listtransit1code,
                            style: TextStyle(color: Colors.green),
                          ),
                          subtitle: listtransit1name == null? Text(
                            "Location",
                            style: TextStyle(color: Colors.blue),
                          ): Text(
                            listtransit1location,
                            style: TextStyle(color: Colors.blue),
                          ),
                          onTap: () {
                            Bantek.goToListAircraftTransit1(context);
                          },
                        ),
                      ),
                      Card(
                        color: Colors.grey[200],
                        child: ListTile(
                          leading: new CircleAvatar(
                              backgroundImage: AssetImage('assets/icon.png')),
                          title: listtransit2name == null? Text(
                            "Airport",
                            style: TextStyle(color: Colors.green),
                          ): Text(
                            listtransit2name+' '+listtransit2code,
                            style: TextStyle(color: Colors.green),
                          ),
                          subtitle: listtransit2name == null? Text(
                            "Location",
                            style: TextStyle(color: Colors.blue),
                          ): Text(
                            listtransit2location,
                            style: TextStyle(color: Colors.blue),
                          ),
                          onTap: () {
                            Bantek.goToListAircraftTransit2(context);
                          },
                        ),
                      ),
                      Card(
                        color: Colors.grey[200],
                        child: ListTile(
                          leading: new CircleAvatar(
                              backgroundImage: AssetImage('assets/icon.png')),
                          title: listtransit3name == null? Text(
                            "Airport",
                            style: TextStyle(color: Colors.green),
                          ): Text(
                            listtransit3name+' '+listtransit3code,
                            style: TextStyle(color: Colors.green),
                          ),
                          subtitle: listtransit3name == null? Text(
                            "Location",
                            style: TextStyle(color: Colors.blue),
                          ): Text(
                            listtransit3location,
                            style: TextStyle(color: Colors.blue),
                          ),
                          onTap: () {
                            Bantek.goToListAircraftTransit3(context);
                          },
                        ),
                      ),
                      Card(
                        color: Colors.grey[200],
                        child: ListTile(
                          leading: new CircleAvatar(
                              backgroundImage: AssetImage('assets/icon.png')),
                          title: listtransit4name == null? Text(
                            "Airport",
                            style: TextStyle(color: Colors.green),
                          ): Text(
                            listtransit4name+' '+listtransit4code,
                            style: TextStyle(color: Colors.green),
                          ),
                          subtitle: listtransit4name == null? Text(
                            "Location",
                            style: TextStyle(color: Colors.blue),
                          ): Text(
                            listtransit4location,
                            style: TextStyle(color: Colors.blue),
                          ),
                          onTap: () {
                            Bantek.goToListAircraftTransit4(context);
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
                    // border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(32.0)),
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
                    // border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(32.0)),
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
                  // decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(32.0),
                      // border: Border.all(color: Colors.grey)),
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
                    String name = prefs.getString('nama');
                    String id = prefs.getString('nopeg');
                    String division = prefs.getString('unit');
                    String airportname,airportcode,airportlocation;
                    airportname=listfromname;
                    airportcode=listfromcode;
                    airportlocation=listfromlocation;
                    if(listtransit1name!=null){
                      airportname+="->"+listtransit1name;
                      airportcode+="->"+listtransit1code;
                      airportlocation+="->"+listtransit1location;
                    }
                    if(listtransit2name!=null){
                      airportname+="->"+listtransit2name;
                      airportcode+="->"+listtransit2code;
                      airportlocation+="->"+listtransit2location;
                    }
                    if(listtransit3name!=null){
                      airportname+="->"+listtransit3name;
                      airportcode+="->"+listtransit3code;
                      airportlocation+="->"+listtransit3location;
                    }
                    if(listtransit4name!=null){
                      airportname+="->"+listtransit4name;
                      airportcode+="->"+listtransit4code;
                      airportlocation+="->"+listtransit4location;
                    }
                    http.post(Bantek.url_submit_form, body: {
                      'id': id.toString(),
                      'name': name.toString(),
                      'division': division.toString(),
                      'departure_date': departure_date.text.toString(),
                      'return_date': return_date.text.toString(),  
                      'airportnamefrom':airportname.toString(),                    
                      'airportcodefrom':airportcode.toString(),                    
                      'airportlocationfrom':airportlocation.toString(),   

                      'airportnameto':listtoname.toString(),                    
                      'airportcodeto':listtocode.toString(),                    
                      'airportlocationto':listtolocation.toString(),                   
                      'type_of_bantek': type_of_bantek.toString(),
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
