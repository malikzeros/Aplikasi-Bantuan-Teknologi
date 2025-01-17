import 'dart:io';
import 'package:flutter/material.dart';
import 'package:bantek/bantek.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:bantek/widgets/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
class HomeAdminScreen extends StatefulWidget {
  @override
  _HomeAdminScreenState createState() => new _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen>
    with TickerProviderStateMixin {
  /////////////////////////////////////////////////////////////////////////////////////////////////
  ///Variable
  /////////////////////////////////////////////////////////////////////////////////////////////////
  TextEditingController datefrom = TextEditingController();
  TextEditingController dateto = TextEditingController();
  final now=DateTime.now();
  final format = DateFormat("yyyy-MM-dd");
  List data = [];
  List datareport = [];
  var remarks;
  int radiovalue;
  String nama = ' ';
  String nopeg = ' ';
  String unit = ' ';
  String email = ' ';
  /////////////////////////////////////////////////////////////////////////////////////////////////
  ///Controller
  /////////////////////////////////////////////////////////////////////////////////////////////////
  Future<String> getData(status) async {
    if (status == "init") {
      var res = await http.post(Uri.encodeFull(Bantek.url_list),headers: {'accept': 'application/json'});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        var content = json.decode(res.body);
        data = content['hasil'];
        nama = prefs.getString('nama');
        nopeg = prefs.getString('nopeg');
        unit = prefs.getString('unit');
        email = prefs.getString('email');
      });
    }
    if (status == "namaasc") {
      var response = await http.post(Bantek.url_list,
          body: {'namaasc': 'namaasc'}, headers: {'accept': 'application/json'});
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    if (status == "namadesc") {
      var response = await http.post(Bantek.url_list,
          body: {'namadesc': 'namadesc'}, headers: {'accept': 'application/json'});
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    if (status == "tanggalasc") {
      var response = await http.post(Bantek.url_list,
          body: {'tanggalasc': 'tanggalasc'}, headers: {'accept': 'application/json'});
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    if (status == "tanggaldesc") {
      var response = await http.post(Bantek.url_list,
          body: {'tanggaldesc': 'tanggaldesc'}, headers: {'accept': 'application/json'});
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    if (status == "stationkeberangkatanasc") {
      var response = await http.post(Bantek.url_list,
          body: {'stationkeberangkatanasc': 'stationkeberangkatanasc'}, headers: {'accept': 'application/json'});
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    if (status == "stationkeberangkatandesc") {
      var response = await http.post(Bantek.url_list,
          body: {'stationkeberangkatandesc': 'stationkeberangkatandesc'}, headers: {'accept': 'application/json'});
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    if (status == "stationkepulanganasc") {
      var response = await http.post(Bantek.url_list,
          body: {'stationkepulanganasc': 'stationkepulanganasc'}, headers: {'accept': 'application/json'});
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    if (status == "stationkepulangandesc") {
      var response = await http.post(Bantek.url_list,
          body: {'stationkepulangandesc': 'stationkepulangandesc'}, headers: {'accept': 'application/json'});
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }
    if (status == "approveasc") {
      var response = await http.post(Bantek.url_list,
          body: {'approveasc': 'approveasc'}, headers: {'accept': 'application/json'});
      setState(() {
        var content = json.decode(response.body);
        data = content['hasil'];
      });
    }  
    if (status == "approvedesc") {
      var response = await http.post(Bantek.url_list,
          body: {'approvedesc': 'approvedesc'}, headers: {'accept': 'application/json'});
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

  Future banteklogout() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Logout User"),
          content: new Text("Apa kamu yakin mau logout?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Tidak"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
               prefs.clear();
                Bantek.goToLogout(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future bantekreport() async {
    var res = await http.post(Uri.encodeFull(Bantek.url_report),
    body: {'datefrom': datefrom.text , 'dateto': dateto.text},
    headers: {'accept': 'application/json'});
    var content = json.decode(res.body);
    datareport = content['hasil'];
    print(content);
    List<List<dynamic>> rows = List<List<dynamic>>();
    List<dynamic> row = List();
    row.add("ID");
    row.add("Name");
    row.add("Division");
    row.add("Departure Station");
    row.add("LEG ST 1");
    row.add("LEG ST 2");
    row.add("LEG ST 3");
    row.add("LEG ST 4");
    row.add("LEG ST 5");
    row.add("Departure City");
    row.add("LEG CITY 1");
    row.add("LEG CITY 2");
    row.add("LEG CITY 3");
    row.add("LEG CITY 4");
    row.add("LEG CITY 5");
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
    row.add("Voucher Amount USD");
    row.add("Voucher Amount IDR");
    row.add("Aml Image");
    row.add("Status");
    row.add("SPPD Number");
	row.add("Created Date");
    rows.add(row);
    for (int i = 0; i <= datareport.length - 1; i++) {
      List<dynamic> row = List();
      row.add(datareport[i]['id']);
      row.add(datareport[i]['name']);
      row.add(datareport[i]['division']);
      row.add(datareport[i]['departure_station']);
      row.add(datareport[i]['leg_st_1']);
      row.add(datareport[i]['leg_st_2']);
      row.add(datareport[i]['leg_st_3']);
      row.add(datareport[i]['leg_st_4']);
      row.add(datareport[i]['leg_st_5']);
      row.add(datareport[i]['departure_city']);
      row.add(datareport[i]['leg_city_1']);
      row.add(datareport[i]['leg_city_2']);
      row.add(datareport[i]['leg_city_3']);
      row.add(datareport[i]['leg_city_4']);
      row.add(datareport[i]['leg_city_5']);
      row.add(datareport[i]['departure_date']);
      row.add(datareport[i]['return_date']);
      row.add(datareport[i]['type_bantek']);
      row.add(datareport[i]['remaks']);
      row.add(datareport[i]['sppd_image']);
      row.add(datareport[i]['tiket_image']);
      row.add(datareport[i]['tiket_amount']);
      row.add(datareport[i]['invoice_image']);
      row.add(datareport[i]['invoice_amount']);
      row.add(datareport[i]['voucher_image']);
      row.add(datareport[i]['voucher_amount']);
      row.add(datareport[i]['voucher_amount1']);
      row.add(datareport[i]['aml_image']);
      row.add(datareport[i]['status']);
      row.add(datareport[i]['sppdnumber']);
	  row.add(data[i]['created_date']);
      rows.add(row);
    }
    Directory appDocDir = await getExternalStorageDirectory();
    String appDocPath = appDocDir.path;
    print(" FILE " + appDocPath);
    File f = new File(appDocPath + "/report.csv");
    String csv = const ListToCsvConverter().convert(rows);
    f.writeAsString(csv);
    try {
      // final ByteData bytes = await rootBundle.load(appDocPath+'/report.csv');
      var bytes = await f.readAsBytes();
      await Share.file('Share The Report','report.csv',bytes.buffer.asUint8List(),'*/*',text: "Report Bantek");
    } catch (e) {
      print('error: $e');
    }
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       content: Text("File : " + appDocPath + "report.csv"),
    //     );
    //   },
    // );
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////
  ///Widget
  /////////////////////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Column(
      children: <Widget>[profiling(),horizontalline(), buttongroup(), listbantek()],
    )), onWillPop: () {
     showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Logout User"),
          content: new Text("Apa kamu yakin mau logout?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Tidak"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                Bantek.goToLogout(context);
              },
            ),
          ],
        );
      },
    );
    },
    );
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
Widget horizontalline(){
    return Container(
      margin: new EdgeInsetsDirectional.only(start: 0.0, end: 0.0),
      height: 5.0,
      color: Colors.green,
    );
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
                  Icons.sd_storage,
                  color: Colors.blue,
                ),
                label: Text("Report", style: TextStyle(color: Colors.blue)),
                onPressed: (){
                  showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Report"),
          content: Container(
            height: 100.0,
            child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("From"),
                  SizedBox(width: 5,),
              SizedBox(
                width: 175,
                child: DateTimeField(
                    controller: datefrom,
                    decoration: InputDecoration(
                      hintText: now.toString(),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
              )
                ],
              ),              
              Row(
                children: <Widget>[
                  Text("Until"),
                  SizedBox(width: 10,),
              SizedBox(
                width: 175,
                child: DateTimeField(
                    controller: dateto,
                    decoration: InputDecoration(
                      hintText: now.toString(),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
              )
                ],
              )
            ],
          ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Generate Report"),
              onPressed: () {
                bantekreport();
              },
            ),
          ],
        );
      },
    );
                },
              ),
              PopupMenuButton(
                icon: Icon(
                  Icons.arrow_drop_down,
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
              ),
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
                      SizedBox(
                        width: 350,
                        child: Wrap(
                        children: <Widget>[
                          Text(
                            data[index]['departure_station'],
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),
                          data[index]['leg_st_1']!='null'?
                          Wrap(
                            children: <Widget>[
                              Image.asset('assets/iconairtport.png',width: 32.0,height: 12.0,),
                          Text(data[index]['leg_st_1'],style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),],):Container(width: 0, height: 0),  
                          data[index]['leg_st_2']!='null'?
                          Wrap(
                            children: <Widget>[
                              Image.asset('assets/iconairtport.png',width: 32.0,height: 12.0,),
                          Text(data[index]['leg_st_2'],style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),],):Container(width: 0, height: 0),   
                          data[index]['leg_st_3']!='null'?
                          Wrap(
                            children: <Widget>[
                              Image.asset('assets/iconairtport.png',width: 32.0,height: 12.0,),
                          Text(data[index]['leg_st_3'],style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),],):Container(width: 0, height: 0),  
                          data[index]['leg_st_4']!='null'?
                          Wrap(
                            children: <Widget>[
                              Image.asset('assets/iconairtport.png',width: 32.0,height: 12.0,),
                          Text(data[index]['leg_st_4'],style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),],):Container(width: 0, height: 0),  
                          data[index]['leg_st_5']!='null'?
                          Wrap(
                            children: <Widget>[
                              Image.asset('assets/iconairtport.png',width: 32.0,height: 12.0,),
                          Text(data[index]['leg_st_5'],style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),],):Container(width: 0, height: 0),  
                        ],
                      ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: 350,
                        child: Wrap(
                        children: <Widget>[
                          Text(
                            data[index]['departure_city'],
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),
                          data[index]['leg_city_1']!='null'?
                          Wrap(
                            children: <Widget>[
                              Image.asset('assets/iconairtport.png',width: 32.0,height: 12.0,),
                          Text(data[index]['leg_city_1'],style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),],):Container(width: 0, height: 0),   
                          data[index]['leg_city_2']!='null'?
                          Wrap(
                            children: <Widget>[
                              Image.asset('assets/iconairtport.png',width: 32.0,height: 12.0,),
                          Text(data[index]['leg_city_2'],style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),],):Container(width: 0, height: 0),   
                          data[index]['leg_city_3']!='null'?
                          Wrap(
                            children: <Widget>[
                              Image.asset('assets/iconairtport.png',width: 32.0,height: 12.0,),
                          Text(data[index]['leg_city_3'],style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),],):Container(width: 0, height: 0),   
                          data[index]['leg_city_4']!='null'?
                          Wrap(
                            children: <Widget>[
                              Image.asset('assets/iconairtport.png',width: 32.0,height: 12.0,),
                          Text(data[index]['leg_city_4'],style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),],):Container(width: 0, height: 0),   
                          data[index]['leg_city_5']!='null'?
                          Wrap(
                            children: <Widget>[
                              Image.asset('assets/iconairtport.png',width: 32.0,height: 12.0,),
                          Text(data[index]['leg_city_5'],style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                          ),],):Container(width: 0, height: 0),   
                        ],
                      ),
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
                                // color: Colors.green,
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
                                // color: Colors.green,
                                fontStyle: FontStyle.italic,
                                fontSize: 15.0),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text("SPPD",style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10.0)),
                              Icon((data[index]['sppd_image'] != '0')
                              ? Icons.check_box
                              : Icons.check_box_outline_blank),
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(children: <Widget>[
                            Text("TICKET",textAlign:TextAlign.left , style: TextStyle(fontStyle: FontStyle.italic,fontSize: 10.0)),
                            Row(
                              children: <Widget>[
                                Icon((data[index]['tiket_image'] != '0')
                              ? Icons.check_box
                              : Icons.check_box_outline_blank),
                              Text(data[index]['tiket_amount'].toString(),style: TextStyle(fontStyle: FontStyle.italic,
                                          fontSize: 10.0)),
                              ],
                            )
                          ],),
                          SizedBox(width: 10),
                          Column(children: <Widget>[
                            Text("INVOICE",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 10.0)),
                            Row(children: <Widget>[
                              Icon((data[index]['invoice_image'] != '0')
                              ? Icons.check_box
                              : Icons.check_box_outline_blank),
                              Text(data[index]['invoice_amount'].toString(),
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 10.0)),
                            ],)
                          ],),
                          SizedBox(width: 10),
                          Column(children: <Widget>[
                            Text("VOUCHER",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 10.0)),
                            Row(children: <Widget>[
                              Icon((data[index]['voucher_image'] != '0')
                              ? Icons.check_box
                              : Icons.check_box_outline_blank),
                              Column(
                                children: <Widget>[
                                  Text(data[index]['voucher_amount'].toString(),
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 10.0)),
                                          Text(data[index]['voucher_amount1'].toString(),
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 10.0)),
                                ],
                              )
                            ],)
                          ],),
                          SizedBox(width: 10),
                          Column(
                            children: <Widget>[
                              Text("AML",style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10.0)),
                              Icon((data[index]['aml_image'] != '0')
                              ? Icons.check_box
                              : Icons.check_box_outline_blank),
                            ],
                          ),
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
      return Colors.red[200];
    } else {
      if (sppd != '0' &&
          ticket != '0' &&
          invoice != '0' &&
          voucher != '0' &&
          aml != '0') {
        return Colors.green[200];
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
            child: const Text('APPROVED', style: TextStyle(color: Colors.blue)),
            onPressed: () {/* ... */},
          ),
        ],
      );
    } else {
      return ButtonBar(
        children: <Widget>[
          Radio(
            value: id_bantek + 1,
            groupValue: radiovalue,
            onChanged: (value) {
              setState(() {
                radiovalue = value;
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
            value: id_bantek + 100,
            groupValue: radiovalue,
            onChanged: (value) {
              setState(() {
                radiovalue = value;
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
            child: const Text('APPROVE', style: TextStyle(color: Colors.blue)),
            onPressed: () async {
              if(remarks==null){
                return showDialog(context: context,builder: (context) {return AlertDialog(content: Text("Mohon Pilih PBTH atau TMB"),);
            },
          );
              }else{
              await http.post(Bantek.url_submit_status, body: {
                'remarks': remarks.toString(),
                'id_bantek': id_bantek.toString(),
                'status': 'Y'
              }, headers: {
                'accept': 'application/json'
              });
              var res = await http.post(Uri.encodeFull(Bantek.url_list),
                  headers: {'accept': 'application/json'});
              setState(() {
                var content = json.decode(res.body);
                data = content['hasil'];
              });
              return 'success!';
            }
            },
          ),
        ],
      );
    }
  }
}
