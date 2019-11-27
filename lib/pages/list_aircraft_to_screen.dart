import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bantek/bantek.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListAircraftToScreen extends StatefulWidget {
  @override
  _ListAircraftToScreenState createState() => new _ListAircraftToScreenState();
}

class _ListAircraftToScreenState extends State<ListAircraftToScreen> {
  TextEditingController controller = new TextEditingController();

  // Get json result and convert it to model. Then add
  Future<Null> getUserDetails() async {
    final response = await http.get(Bantek.url_airport);
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
        title: new Text('Airport List'),
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
                    leading: new CircleAvatar(backgroundImage: new NetworkImage(_searchResult[i].profileUrl,),),
                    title: new Text(_searchResult[i].name),  
                    subtitle: new Text(_searchResult[i].location),  
                    onTap: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('listtoname', _searchResult[i].name);
                      prefs.setString('listtocode', _searchResult[i].code);
                      prefs.setString('listtolocation', _searchResult[i].location);
                      _userDetails.clear();
                      _searchResult.clear();
                      Bantek.goToFormBantekFromTo(context);
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
                    leading: new CircleAvatar(backgroundImage: new NetworkImage(_userDetails[index].profileUrl,),),
                    title: new Text(_userDetails[index].name),
                    subtitle: new Text(_userDetails[index].location),
                    onTap: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('listtoname', _userDetails[index].name);
                      prefs.setString('listtocode', _userDetails[index].code);
                      prefs.setString('listtolocation', _userDetails[index].location);
                      _userDetails.clear();
                      _searchResult.clear();
                      Bantek.goToFormBantekFromTo(context);
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
      Bantek.goToFormBantek(context);
    },
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails.forEach((userDetail) {
      if (userDetail.code.contains(text) || userDetail.name.contains(text))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }
}

List<UserDetails> _searchResult = [];

List<UserDetails> _userDetails = [];
class UserDetails {
  final int id;
  final String code, name,city,location, profileUrl;

  UserDetails({this.id, this.code, this.name,this.city,this.location , this.profileUrl = Bantek.url_list_aircraft});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return new UserDetails(
      id: json['id_airport'],
      code: json['code'],
      name: json['name'],
      city: json['city'],
      location: json['location'],
    );
  }
}