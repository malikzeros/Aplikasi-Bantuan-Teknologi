import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bantek/utils/bantek.dart';
import 'package:bantek/utils/my_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';

final String url_list = Bantek.url_list;
final String urlsubmitstatus=Bantek.url_submit_status;
List data;

var remarks;
int radiovalue;
class HomeAdminScreen extends StatefulWidget {
  @override
  _HomeAdminScreenState createState() => new _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> with TickerProviderStateMixin {
  AnimationController animCtrl;
  Animation<double> animation;

  AnimationController animCtrl2;
  Animation<double> animation2;
  TabController controller;
  bool showFirst = true;

  String name='<Name>';
  String id='<ID>';
  Future<String> getData() async {
    var res = await http.post(Uri.encodeFull(url_list), headers: { 'accept':'application/json' });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      var content = json.decode(res.body);
      data = content['hasil'];
      print(data);
      name=prefs.getString('name');
      id=prefs.getString('id');
    });
    return 'success!';
  }

  @override
  void initState() {
    this.getData();
    super.initState();
    controller = TabController(vsync: this, length: 2);
    // Animation init
    animCtrl = new AnimationController(
        duration: new Duration(milliseconds: 500), vsync: this);
    animation = new CurvedAnimation(parent: animCtrl, curve: Curves.easeOut);
    animation.addListener(() {
      this.setState(() {});
    });
    animation.addStatusListener((AnimationStatus status) {});

    animCtrl2 = new AnimationController(
        duration: new Duration(milliseconds: 1000), vsync: this);
    animation2 = new CurvedAnimation(parent: animCtrl2, curve: Curves.easeOut);
    animation2.addListener(() {
      this.setState(() {});
    });
    animation2.addStatusListener((AnimationStatus status) {});
  }

  @override
  void dispose() {
    controller.dispose();
    animCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(Bantek.name),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
          )
        ],
         bottom: TabBar(
            controller: controller,
            tabs: <Tab>[
              Tab(icon: Icon(Icons.home),),
              Tab(icon: Icon(Icons.search),),
              // Tab(icon: Icon(Icons.thumb_up),),
            ]
          ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(name),
              accountEmail: Text(id),
              currentAccountPicture: new Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                      "https://talentlead.gmf-aeroasia.co.id/images/avatar/"+id+".jpg",
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.blue),),
              ListTile(
              title: Text('Sorting Data',style: TextStyle(color: Colors.blue),),
              
            ),
            ListTile(
              leading: Icon(Icons.sort,color: Colors.blue),
              title: Text('Tanggal',style: TextStyle(color: Colors.blue),),
              trailing: Icon(Icons.arrow_forward,color: Colors.blue),
              onTap: () async {
                var response = await http.post(url_list, body: {'tanggal' : 'tanggal'},headers: { 'accept':'application/json' });
                      print('Response status: ${response.statusCode}');
                      print('Response body: ${response.body}');     
                      Navigator.pop(context);                 
                      setState(() {
                            var content = json.decode(response.body);
                            data = content['hasil'];
                          });
              },
            ),
            ListTile(
              leading: Icon(Icons.sort,color: Colors.blue),
              title: Text('Approved',style: TextStyle(color: Colors.blue),),
              trailing: Icon(Icons.arrow_forward,color: Colors.blue),
              onTap: () async {
                var response = await http.post(url_list, body: {'approved' : 'approved'},headers: { 'accept':'application/json' });
                      print('Response status: ${response.statusCode}');
                      print('Response body: ${response.body}');     
                      Navigator.pop(context);                 
                      setState(() {
                            var content = json.decode(response.body);
                            data = content['hasil'];
                          });
              },
            ),
            ListTile(
              leading: Icon(Icons.sort,color: Colors.blue),
              title: Text('Nama',style: TextStyle(color: Colors.blue),),
              trailing: Icon(Icons.arrow_forward,color: Colors.blue),
              onTap: () async {
                var response = await http.post(url_list, body: {'nama' : 'nama'},headers: { 'accept':'application/json' });
                      print('Response status: ${response.statusCode}');
                      print('Response body: ${response.body}');     
                      Navigator.pop(context);                 
                      setState(() {
                            var content = json.decode(response.body);
                            data = content['hasil'];
                          });
              },
            ),
            ListTile(
              leading: Icon(Icons.sort,color: Colors.blue),
              title: Text('Station Keberangkatan',style: TextStyle(color: Colors.blue),),
              trailing: Icon(Icons.arrow_forward,color: Colors.blue),
              onTap: () async {
                var response = await http.post(url_list, body: {'station_keberangkatan' : 'station_keberangkatan'},headers: { 'accept':'application/json' });
                      print('Response status: ${response.statusCode}');
                      print('Response body: ${response.body}');     
                      Navigator.pop(context);                 
                      setState(() {
                            var content = json.decode(response.body);
                            data = content['hasil'];
                          });
              },
            ),
            ListTile(
              leading: Icon(Icons.sort,color: Colors.blue),
              title: Text('Station Kepulangan',style: TextStyle(color: Colors.blue),),
              trailing: Icon(Icons.arrow_forward,color: Colors.blue),
              onTap: () async {
                var response = await http.post(url_list, body: {'station_kepulangan' : 'station_kepulangan'},headers: { 'accept':'application/json' });
                      print('Response status: ${response.statusCode}');
                      print('Response body: ${response.body}');     
                      Navigator.pop(context);                 
                      setState(() {
                            var content = json.decode(response.body);
                            data = content['hasil'];
                          });
              },
            ),
            ListTile(
              title: Text('Menu',style: TextStyle(color: Colors.blue),),
              
            ),
            ListTile(
              leading: Icon(Icons.report,color: Colors.blue),
              title: Text('Report',style: TextStyle(color: Colors.blue)),
              trailing: Icon(Icons.arrow_forward,color: Colors.blue),
              onTap: () async {
			  List<List<dynamic>> rows = List<List<dynamic>>();
			  List<dynamic> row = List();
                  row.add("ID");
                  row.add("Name");
                  row.add("Division");
                  row.add("Departure Station");
                  row.add("Arrival Station");
                  row.add("Departure City");
                  row.add("Arrival City");
                  row.add("Departure Date");
                  row.add("Return Date");
                  row.add("Type Bantek");
                  row.add("Remaks");
                  row.add("SPPD Image");
                  row.add("Tiket Image");
                  row.add("Tiket Amount");
                  row.add("Invoice Image");
                  row.add("Invoice Amount");
                  row.add("Voucher Image");
                  row.add("Voucher Amount");
                  row.add("Aml Image");
                  row.add("Status");
                  rows.add(row);
                for (int i = 0; i <=data.length-1;i++) {
			          	List<dynamic> row = List();
                  row.add(data[i]['id']);
                  row.add(data[i]['name']);
                  row.add(data[i]['division']);
                  row.add(data[i]['departure_code']);
                  row.add(data[i]['arrival_code']);
                  row.add(data[i]['departure_city']);
                  row.add(data[i]['arrival_city']);
                  row.add(data[i]['departure_date']);
                  row.add(data[i]['return_date']);
                  row.add(data[i]['type_bantek']);
                  row.add(data[i]['remaks']);
                  row.add(data[i]['sppd_image']);
                  row.add(data[i]['tiket_image']);
                  row.add(data[i]['tiket_amount']);
                  row.add(data[i]['invoice_image']);
                  row.add(data[i]['invoice_amount']);
                  row.add(data[i]['voucher_image']);
                  row.add(data[i]['voucher_amount']);
                  row.add(data[i]['aml_image']);
                  row.add(data[i]['status']);
                  rows.add(row);
                }
				  Directory appDocDir = await getExternalStorageDirectory();
				  String appDocPath = appDocDir.path;                
                  print(" FILE " + appDocPath);
                  File f = new File(appDocPath+"report.csv");
                  String csv = const ListToCsvConverter().convert(rows);
                  f.writeAsString(csv);
				  return showDialog(context: context,builder: (context) {return AlertDialog(content: Text("File : "+appDocPath+"report.csv"),);
            },
          );
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app,color: Colors.blue),
              title: Text('Logout',style: TextStyle(color: Colors.blue)),
              trailing: Icon(Icons.arrow_forward,color: Colors.blue),
              onTap: () async {
                
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove("name");
                prefs.remove("id");
                MyNavigator.goToLogout(context);
                
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
          controller: controller,
          children: <Widget>[
          Container(
          margin: EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: data == null ? 0:data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(                
                child: Card(
                  color: colorstatus(data[index]['sppd_image'],data[index]['tiket_image'],data[index]['invoice_image'],data[index]['voucher_image'],data[index]['aml_image'],data[index]['status']),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,children: <Widget>[
                    ListTile(
                      // leading: Text(data[index]['id_bantek'].toString(), style: TextStyle(fontSize: 30.0),),
                      title: Text(data[index]['division'].toString()+' - '+data[index]['id'].toString()+' - '+data[index]['name'].toString(), style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                      // trailing: Image.asset('assets/iconairtport.png', width: 32.0, height: 32.0,),

                      subtitle: Column(children: <Widget>[
                        Row(
                          children: <Widget>[
                            
                            Text(data[index]['departure_code'], style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),),
                            Image.asset('assets/iconairtport.png', width: 32.0, height: 12.0,),
                            Text(data[index]['arrival_code'], style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(data[index]['departure_city'], style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),),
                            Image.asset('assets/iconairtport.png', width: 32.0, height: 12.0,),
                            Text(data[index]['arrival_city'], style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),),
                            
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('From', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),),
                            Image.asset('assets/iconairtport.png', width: 32.0, height: 12.0,),
                            Text('Until', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),),
                            ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(data[index]['departure_date'], style: TextStyle(color: Colors.green, fontStyle: FontStyle.italic, fontSize: 15.0),),
                            Image.asset('assets/iconairtport.png', width: 32.0, height: 12.0,),
                            Text(data[index]['return_date'], style: TextStyle(color: Colors.green,fontStyle: FontStyle.italic, fontSize: 15.0),),
                            ],
                        ),
                        Row(                          
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[        
                            Icon((data[index]['sppd_image']!='0')? Icons.check_box:Icons.check_box_outline_blank),
                            Text("SPPD", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10.0)),
                            Icon((data[index]['tiket_image']!='0')? Icons.check_box:Icons.check_box_outline_blank),
                            Column(children: <Widget>[
                              Row(children: <Widget>[
                                Text("TICKET", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10.0)),
                              ],                              
                              ),
                              Row(children: <Widget>[
                                Text(data[index]['tiket_amount'].toString(), style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10.0)),

                              ],)
                            ],),
                            Icon((data[index]['invoice_image']!='0')? Icons.check_box:Icons.check_box_outline_blank),
                            Column(children: <Widget>[
                              Row(children: <Widget>[
                                Text("INVOICE", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10.0)),
                              ],                              
                              ),
                              Row(children: <Widget>[
                                Text(data[index]['invoice_amount'].toString(), style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10.0)),

                              ],)
                            ],),
                            Icon((data[index]['voucher_image']!='0')? Icons.check_box:Icons.check_box_outline_blank),
                            Column(children: <Widget>[
                              Row(children: <Widget>[
                                Text("VOUCHER", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10.0)),
                              ],                              
                              ),
                              Row(children: <Widget>[
                                Text(data[index]['voucher_amount'].toString(), style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10.0)),

                              ],)
                            ],),
                            Icon((data[index]['aml_image']!='0')? Icons.check_box:Icons.check_box_outline_blank),
                            Text("AML", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10.0)),                                                       
                            ],
                        ),
                        Row(children: <Widget>[
                          Text("Remarks : ", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10.0)), 
                          Text(data[index]['remaks'], style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12.0)), 
                        ],)
                      ],),
                    ),
                    ButtonTheme.bar(
                      child: _status(data[index]['status'],data[index]['id_bantek'])
                    ),
                  ],),
                )
              );
            },
          ),
        ),
        Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget> [
            Container(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Nopeg',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  child: Text("Search"),
                  highlightElevation: 2,
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: (){},
                ),
              ),
          ]
        )
      ),
          ]
        ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.blue,
      //   onPressed: () => {},
      //   child: Icon(Icons.add, color: Colors.white),
      // ),
    );
  }
  Color colorstatus(sppd,ticket,invoice,voucher,aml,status){
  if (status!='Y') {
    return Colors.white;
  } else {
    if (sppd!='0' && ticket!='0' && invoice!='0' && voucher!='0' && aml!='0') {
      return Colors.yellow;
    } else {
      return Colors.pink[100];
    }
  }
}
 
Widget _status(status,id_bantek) {
  if (status=='Y') {
    return ButtonBar(
            children: <Widget>[                          
              FlatButton(
                child: const Text('APPROVED'),
                onPressed: () { /* ... */ },
              ),
            ],
          );
  } else {
        return ButtonBar(
                  children: <Widget>[
                    Radio(
                      value: id_bantek+1,
                      groupValue: radiovalue,
                  onChanged: (value) {
                setState(() {
				radiovalue=value;
                  remarks = 'PBTH';
                  print(value);
                });
              },
                ),
                new Text(
                  'PBTH',
                  style: new TextStyle(fontSize: 16.0),
                ),
                new Radio(
                  value: id_bantek+100,
                  groupValue: radiovalue,
                  onChanged: (value) {
                setState(() {
				radiovalue=value;
                  remarks = "TMB";
                  print(value);
                });
              },
                ),
                new Text(
                  'TMB',
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                FlatButton(
                  child: const Text('APPROVE'),
                  onPressed: () async {
                      var response = await http.post(urlsubmitstatus, body: { 'remarks': remarks.toString(),'id_bantek': id_bantek.toString(), 'status': 'Y'},headers: { 'accept':'application/json' });
                      print('Response status: ${response.statusCode}');
                      print('Response body: ${response.body}');
                      var res = await http.post(Uri.encodeFull(url_list), headers: { 'accept':'application/json' });
                      setState(() {
                            var content = json.decode(res.body);
                            data = content['hasil'];
                            print(data);
                          });
                          return 'success!';
                   },
                ),
              ],
            );
  }
}
}