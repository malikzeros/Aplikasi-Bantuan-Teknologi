import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bantek/bantek.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListAircraftSPPDScreen extends StatefulWidget {
  @override
  _ListAircraftSPPDScreenState createState() => new _ListAircraftSPPDScreenState();
}
String nopeg;
class _ListAircraftSPPDScreenState extends State<ListAircraftSPPDScreen> {
  TextEditingController controller = new TextEditingController();

  // Get json result and convert it to model. Then add
  Future<Null> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nopeg = prefs.getString('nopeg');
    final response = await http.get(Bantek.url_sppd+nopeg);
    final responseJson = json.decode(response.body);
    print(responseJson);

    setState(() {
      for (Map user in responseJson) {
        _userDetails.add(UserDetails.fromJson(user));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    getUserDetails();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue,
        title: new Text('SPPD Number List'),
        elevation: 0.0,
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            color: Colors.blue,
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Card(
                child: new ListTile(
                  leading: new Icon(Icons.search),
                  title: new TextField(
                    controller: controller,
                    textCapitalization: TextCapitalization.characters,
                    decoration: new InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    onChanged: onSearchTextChanged,
                  ),
                  trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
                    controller.clear();
                    onSearchTextChanged('');
                  },),
                ),
              ),
            ),
          ),
          new Expanded(
            child: _searchResult.length != 0 || controller.text.isNotEmpty
                ? new ListView.builder(
              itemCount: _searchResult.length,
              itemBuilder: (context, i) {
                return new Card(
                  child: new ListTile(
                    // leading: new CircleAvatar(backgroundImage: new NetworkImage(_searchResult[i].profileUrl,),),
                    title: new Text(_searchResult[i].sppd_number),  
                    subtitle: new Text(_searchResult[i].destination_type),  
                    onTap: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('id_sppd', _searchResult[i].id_sppd);
                      prefs.setString('sppdnumber', _searchResult[i].sppd_number);
                      _userDetails.clear();
                      _searchResult.clear();
                      Bantek.goToFormUploadFromSppd(context);
                    },                
                  ),
                  margin: const EdgeInsets.all(0.0),
                );
              },
            )
                : new ListView.builder(
              itemCount: 0,
              itemBuilder: (context, index) {
                return new Card(
                  child: new ListTile(
                    // leading: new CircleAvatar(backgroundImage: new NetworkImage(_userDetails[index].profileUrl,),),
                    title: new Text(_userDetails[index].sppd_number),
                    subtitle: new Text(_userDetails[index].destination_type),
                    onTap: () async {
                      
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('id_sppd', _userDetails[index].id_sppd);
                      prefs.setString('sppdnumber', _userDetails[index].sppd_number);
                      _userDetails.clear();
                      _searchResult.clear();
                      Bantek.goToFormUploadFromSppd(context);
                    },
                  ),
                  margin: const EdgeInsets.all(0.0),
                );
              },
            ),
          ),
        ],
      ),
    ), onWillPop: () {
      _userDetails.clear();
      _searchResult.clear();
      Bantek.goToFormUpload(context);
    } ,

    );

  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails.forEach((userDetail) {
      if (userDetail.sppd_number.contains(text) || userDetail.destination_type.contains(text))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }
}

List<UserDetails> _searchResult = [];

List<UserDetails> _userDetails = [];
class UserDetails {
  final int id;
  final String sppd_number, destination_type,id_sppd, profileUrl;

  UserDetails({this.id, this.sppd_number, this.destination_type,this.id_sppd, this.profileUrl = Bantek.url_sppd});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return new UserDetails(
      id: json['id_sppd'],
      id_sppd: json['id'],
      sppd_number: json['sppd_number'],
      destination_type: json['destination_type'],
    );
  }
}