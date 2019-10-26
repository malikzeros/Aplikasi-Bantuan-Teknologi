import 'package:flutter/material.dart';
import 'package:bantek/bantek.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeUserScreen extends StatefulWidget {
  @override
  _HomeUserScreenState createState() => new _HomeUserScreenState();
}

class _HomeUserScreenState extends State<HomeUserScreen>
    with TickerProviderStateMixin {
  /////////////////////////////////////////////////////////////////////////////////////////////////
  ///Variable
  /////////////////////////////////////////////////////////////////////////////////////////////////
  List data = [];
  var remarks;
  int radiovalue;
  String nama = 'Full Name';
  String nopeg = '582813';
  String unit = 'JTKTOB-3';
  String email = 'email@gmf-aeroasia.co.id';
  /////////////////////////////////////////////////////////////////////////////////////////////////
  ///Controller
  /////////////////////////////////////////////////////////////////////////////////////////////////
  Future<String> getData(status) async {
    if (status == "init") {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      nama = prefs.getString('nama');
      nopeg = prefs.getString('nopeg');
      unit = prefs.getString('unit');
      email = prefs.getString('email');
      var res = await http.post(Uri.encodeFull(Bantek.url_list),
          body: {'nopeg': nopeg}, headers: {'accept': 'application/json'});
      setState(() {
        var content = json.decode(res.body);
        data = content['hasil'];
      });
    }
    if (status == "namaasc") {
      var response = await http.post(Bantek.url_list,
          body: {'namaasc': 'namaasc', 'nopeg': nopeg},
          headers: {'accept': 'application/json'});
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    if (status == "namadesc") {
      var response = await http.post(Bantek.url_list,
          body: {'namadesc': 'namadesc', 'nopeg': nopeg},
          headers: {'accept': 'application/json'});
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    if (status == "tanggalasc") {
      var response = await http.post(Bantek.url_list,
          body: {'tanggalasc': 'tanggalasc', 'nopeg': nopeg},
          headers: {'accept': 'application/json'});
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    if (status == "tanggaldesc") {
      var response = await http.post(Bantek.url_list,
          body: {'tanggaldesc': 'tanggaldesc', 'nopeg': nopeg},
          headers: {'accept': 'application/json'});
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    if (status == "stationkeberangkatanasc") {
      var response = await http.post(Bantek.url_list, body: {
        'stationkeberangkatanasc': 'stationkeberangkatanasc',
        'nopeg': nopeg
      }, headers: {
        'accept': 'application/json'
      });
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    if (status == "stationkeberangkatandesc") {
      var response = await http.post(Bantek.url_list, body: {
        'stationkeberangkatandesc': 'stationkeberangkatandesc',
        'nopeg': nopeg
      }, headers: {
        'accept': 'application/json'
      });
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    if (status == "stationkepulanganasc") {
      var response = await http.post(Bantek.url_list, body: {
        'stationkepulanganasc': 'stationkepulanganasc',
        'nopeg': nopeg
      }, headers: {
        'accept': 'application/json'
      });
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    if (status == "stationkepulangandesc") {
      var response = await http.post(Bantek.url_list, body: {
        'stationkepulangandesc': 'stationkepulangandesc',
        'nopeg': nopeg
      }, headers: {
        'accept': 'application/json'
      });
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    if (status == "approveasc") {
      var response = await http.post(Bantek.url_list, body: {
        'approveasc': 'approveasc',
        'nopeg': nopeg
      }, headers: {
        'accept': 'application/json'
      });
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    if (status == "approvedesc") {
      var response = await http.post(Bantek.url_list, body: {
        'approvedesc': 'approvedesc',
        'nopeg': nopeg
      }, headers: {
        'accept': 'application/json'
      });
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    return 'success!';
  }
  @override
  void initState() {
    super.initState();
    this.getData("init");
  }

  @override
  void dispose() {
    super.dispose();
  }

  void banteklogout() {
    Bantek.goToLogin(context);
  }

  void bantekupload() {
    Bantek.goToFormUpload(context);
  }

  void bantekform() {
    Bantek.goToFormBantek(context);
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////
  ///Widget
  /////////////////////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[profiling(), buttongroup(), listbantek()],
    ));
  }

  Widget profiling() {
    return Container(
        width: 500.0,
        height: 250,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(Bantek.server_url +
                    "/bantek_api/profile_image/headerprofile.png"))),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Center(
              child: GestureDetector(
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://talentlead.gmf-aeroasia.co.id/images/avatar/" +
                                    nopeg +
                                    ".jpg")))),
                onTap: banteklogout,
              ),
            ),
            Center(
              child: Text("Welcome"),
            ),
            Center(
                child:
                    Text(nama, style: TextStyle(fontWeight: FontWeight.bold))),
            Center(
              child:
                  Text("$nopeg | $unit", style: TextStyle(color: Colors.green)),
            ),
            Center(
              child: Text(unit, style: TextStyle(fontSize: 10)),
            ),
            Container(
              color: Colors.green,
            )
          ],
        ));
  }

  Widget buttongroup() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[              
              RaisedButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                color: Colors.white,
                icon: Icon(
                  Icons.flight,
                  color: Colors.blue,
                ),
                label:
                    Text("Create Bantek", style: TextStyle(color: Colors.blue)),
                onPressed: bantekform,
              ),
              SizedBox(width: 20,),
              RaisedButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                color: Colors.white,
                icon: Icon(
                  Icons.file_upload,
                  color: Colors.blue,
                ),
                label: Text("Upload", style: TextStyle(color: Colors.blue)),
                onPressed: bantekupload,
              ),
              PopupMenuButton(
                icon: Icon(
                  Icons.local_bar,
                  color: Colors.blue,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Sort Name A to Z",
                        style: TextStyle(color: Colors.blue)),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("Sort Name Z to A",
                        style: TextStyle(color: Colors.blue)),
                    value: 2,
                  ),
                  PopupMenuItem(
                    child: Text("Sort Date 1 to 9",
                        style: TextStyle(color: Colors.blue)),
                    value: 3,
                  ),
                  PopupMenuItem(
                    child: Text("Sort Date 9 to 1",
                        style: TextStyle(color: Colors.blue)),
                    value: 4,
                  ),
                  PopupMenuItem(
                    child: Text("Sort Departure A to Z",
                        style: TextStyle(color: Colors.blue)),
                    value: 5,
                  ),
                  PopupMenuItem(
                    child: Text("Sort Departure Z to A",
                        style: TextStyle(color: Colors.blue)),
                    value: 6,
                  ),
                  PopupMenuItem(
                    child: Text("Sort Arrival A to Z",
                        style: TextStyle(color: Colors.blue)),
                    value: 7,
                  ),
                  PopupMenuItem(
                    child: Text("Sort Arrival Z to A",
                        style: TextStyle(color: Colors.blue)),
                    value: 8,
                  ),
                  PopupMenuItem(
                    child: Text("Sort Approve asc",
                        style: TextStyle(color: Colors.blue)),
                    value: 9,
                  ),
                  PopupMenuItem(
                    child: Text("Sort Approve desc",
                        style: TextStyle(color: Colors.blue)),
                    value: 10,
                  ),
                ],
                onSelected: (value) {
                  if (value == 1) this.getData("namaasc");
                  if (value == 2) this.getData("namadesc");
                  if (value == 3) this.getData("tanggalasc");
                  if (value == 4) this.getData("tanggaldesc");
                  if (value == 5) this.getData("stationkeberangkatanasc");
                  if (value == 6) this.getData("stationkeberangkatandesc");
                  if (value == 7) this.getData("stationkepulanganasc");
                  if (value == 8) this.getData("stationkepulangandesc");
                  if (value == 9) this.getData("approveasc");
                  if (value == 10) this.getData("approvedesc");
                },
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text("Assigned Trip")
            ],
          )
        ],
      ),
    );
  }

  Widget listbantek() {
    return Expanded(
      child: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: colorstatus(
                data[index]['sppd_image'],
                data[index]['tiket_image'],
                data[index]['invoice_image'],
                data[index]['voucher_image'],
                data[index]['aml_image'],
                data[index]['status']),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  // leading: Text(data[index]['id_bantek'].toString(), style: TextStyle(fontSize: 30.0),),
                  title: Text(
                    data[index]['division'].toString() +
                        ' - ' +
                        data[index]['id'].toString() +
                        ' - ' +
                        data[index]['name'].toString(),
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  // trailing: Image.asset('assets/iconairtport.png', width: 32.0, height: 32.0,),

                  subtitle: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            data[index]['departure_code'],
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),
                          Image.asset(
                            'assets/iconairtport.png',
                            width: 32.0,
                            height: 12.0,
                          ),
                          Text(
                            data[index]['arrival_code'],
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            data[index]['departure_city'],
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),
                          Image.asset(
                            'assets/iconairtport.png',
                            width: 32.0,
                            height: 12.0,
                          ),
                          Text(
                            data[index]['arrival_city'],
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'From',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),
                          Image.asset(
                            'assets/iconairtport.png',
                            width: 32.0,
                            height: 12.0,
                          ),
                          Text(
                            'Until',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            data[index]['departure_date'],
                            style: TextStyle(
                                color: Colors.green,
                                fontStyle: FontStyle.italic,
                                fontSize: 15.0),
                          ),
                          Image.asset(
                            'assets/iconairtport.png',
                            width: 32.0,
                            height: 12.0,
                          ),
                          Text(
                            data[index]['return_date'],
                            style: TextStyle(
                                color: Colors.green,
                                fontStyle: FontStyle.italic,
                                fontSize: 15.0),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon((data[index]['sppd_image'] != '0')
                              ? Icons.check_box
                              : Icons.check_box_outline_blank),
                          Text("SPPD",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 10.0)),
                          Icon((data[index]['tiket_image'] != '0')
                              ? Icons.check_box
                              : Icons.check_box_outline_blank),
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("TICKET",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 10.0)),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(data[index]['tiket_amount'].toString(),
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 10.0)),
                                ],
                              )
                            ],
                          ),
                          Icon((data[index]['invoice_image'] != '0')
                              ? Icons.check_box
                              : Icons.check_box_outline_blank),
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("INVOICE",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 10.0)),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(data[index]['invoice_amount'].toString(),
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 10.0)),
                                ],
                              )
                            ],
                          ),
                          Icon((data[index]['voucher_image'] != '0')
                              ? Icons.check_box
                              : Icons.check_box_outline_blank),
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("VOUCHER",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 10.0)),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(data[index]['voucher_amount'].toString(),
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 10.0)),
                                ],
                              )
                            ],
                          ),
                          Icon((data[index]['aml_image'] != '0')
                              ? Icons.check_box
                              : Icons.check_box_outline_blank),
                          Text("AML",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 10.0)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Remarks : ",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 10.0)),
                          Text(data[index]['remaks'],
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 12.0)),
                        ],
                      ),
                      ButtonTheme.bar(
                          child: _status(
                              data[index]['status'], data[index]['id_bantek']))
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Color colorstatus(sppd, ticket, invoice, voucher, aml, status) {
    if (status != 'Y') {
      return Colors.red;
    } else {
      if (sppd != '0' &&
          ticket != '0' &&
          invoice != '0' &&
          voucher != '0' &&
          aml != '0') {
        return Colors.green;
      } else {
        return Colors.yellow;
      }
    }
  }

  Widget _status(status, id_bantek) {
    if (status == 'Y') {
      return ButtonBar(
        children: <Widget>[
          FlatButton(
            child: const Text('Upload Data', style: TextStyle(color: Colors.blue)),
            onPressed: bantekupload,
          ),
        ],
      );
    } else {
      return ButtonBar(
        children: <Widget>[
          FlatButton(
            child: const Text('Waiting for Approval', style: TextStyle(color: Colors.blue)),
            onPressed: () {},
          )
        ],
      );
    }
  }
}
