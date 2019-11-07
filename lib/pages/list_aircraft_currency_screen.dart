import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bantek/bantek.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListAircraftCurrencyScreen extends StatefulWidget {
  @override
  _ListAircraftCurrencyScreenState createState() => new _ListAircraftCurrencyScreenState();
}

class _ListAircraftCurrencyScreenState extends State<ListAircraftCurrencyScreen> {
  TextEditingController controller = new TextEditingController();

  // Get json result and convert it to model. Then add
  Future<Null> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await http.post(Uri.encodeFull(Bantek.url_Currency),
          body: {'isocode': prefs.getString('isocode')}, headers: {'accept': 'application/json'});
    // final response = await http.get(Bantek.url_Currency);
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
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue,
        title: new Text('Currency Number List'),
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
                    title: new Text(_searchResult[i].currency_number),  
                    subtitle: new Text(_searchResult[i].destination_type),  
                    onTap: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();                      
                      prefs.setString('isocode', _searchResult[i].currency_number);
                      prefs.setString('value', _searchResult[i].destination_type);
                      Bantek.goToFormUploadFromCurrency(context);
                    },                
                  ),
                  margin: const EdgeInsets.all(0.0),
                );
              },
            )
                : new ListView.builder(
              itemCount: _userDetails.length,
              itemBuilder: (context, index) {
                return new Card(
                  child: new ListTile(
                    // leading: new CircleAvatar(backgroundImage: new NetworkImage(_userDetails[index].profileUrl,),),
                    title: new Text(_userDetails[index].currency_number),
                    subtitle: new Text(_userDetails[index].destination_type),
                    onTap: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('isocode', _userDetails[index].currency_number);
                      prefs.setString('value', _userDetails[index].destination_type);
                      Bantek.goToFormUploadFromCurrency(context);
                    },
                  ),
                  margin: const EdgeInsets.all(0.0),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails.forEach((userDetail) {
      if (userDetail.currency_number.contains(text) || userDetail.destination_type.contains(text))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }
}

List<UserDetails> _searchResult = [];

List<UserDetails> _userDetails = [];
class UserDetails {
  final int id;
  final String currency_number, destination_type, profileUrl;

  UserDetails({this.id, this.currency_number, this.destination_type, this.profileUrl = Bantek.url_Currency});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return new UserDetails(
      id: json['id_Currency'],
      currency_number: json['isocode'],
      destination_type: json['value'],
    );
  }
}