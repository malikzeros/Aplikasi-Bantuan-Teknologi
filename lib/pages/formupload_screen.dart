import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:bantek/bantek.dart';
import 'package:bantek/widgets/walkthrough.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormUpload extends StatefulWidget {
  static String tag = 'formupload-page';
  @override
  _FormUploadState createState() => new _FormUploadState();
}

File file_aml, file_sppd, file_invoice, file_tiket, file_voucher;
File _file_aml, _file_sppd, _file_invoice, _file_tiket, _file_voucher,tmpfile;
String name, id, voucheramount, amountperday, sppdnumber,tmpisocode;
String isocodetiket = "IDR",isocodeinvoice = "IDR",isocodevoucher = "IDR",isocodevoucher1 = "USD";
String value = "1";
int currencyvalue = 1;
int totalvoucher,bulat;
double selectedcurrency;
String id_sppd;

// String tiket_amount,invoice_amount,voucher_amount;
TextEditingController tiket_amount = TextEditingController();
TextEditingController invoice_amount = TextEditingController();
TextEditingController voucher_amount = TextEditingController();
TextEditingController voucher_amount1 = TextEditingController();

String _isocodetiket;
String _tiket_amount;
String _voucher_amount;
String _voucher_amount1;
class _FormUploadState extends State<FormUpload> {
  @override
  void initState() {
    super.initState();
    this.getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id_sppd = prefs.getString('id_sppd');
    if(id_sppd!=null){
      final response = await http.get(Bantek.url_voucher_tiket+id_sppd);
    final responseJson = json.decode(response.body);
    _isocodetiket=responseJson['currency_ticket'];
    _tiket_amount=responseJson['ticket'].toString();
    _voucher_amount=responseJson['voucher_usd'].toString();
    _voucher_amount1=responseJson['voucher_idr'].toString();
    }
    setState(() {
      sppdnumber = prefs.getString('sppdnumber');
      tmpisocode = prefs.getString('isocode');
      if(id_sppd!=null){
        isocodetiket=_isocodetiket;
        tiket_amount.text=_tiket_amount;
        isocodevoucher="USD";
        isocodevoucher1="IDR";
        voucher_amount.text=_voucher_amount;
        voucher_amount1.text=_voucher_amount1;
      }
      if(tmpisocode!=null){
        isocodeinvoice = prefs.getString('isocode');
        value = prefs.getString('value');
      }else{
        prefs.setString("isocode", isocodeinvoice);
      }      
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Form Uploads"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          SizedBox(height: 48.0),
          Text("1 SPPD"),
          Card(
            color: Colors.grey[200],
            child: ListTile(
              leading: new CircleAvatar(
                  backgroundImage: AssetImage('assets/icon.png')),
              title: sppdnumber == null
                  ? Text(
                      "SPPD Number",
                      style: TextStyle(color: Colors.green),
                    )
                  : Text(
                      sppdnumber,
                      style: TextStyle(color: Colors.green),
                    ),
              onTap: () {
                Bantek.goToListSppd(context);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  file_sppd = await ImagePicker.pickImage(
                    source: ImageSource.camera,
                    maxHeight: 100,
                    maxWidth: 100,
                  );
                  setState(() {
                    _file_sppd = file_sppd;
                  });
                },
                child: Text('CAMERA'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () async {
                  file_sppd = await ImagePicker.pickImage(
                    source: ImageSource.gallery,
                    maxHeight: 100,
                    maxWidth: 100,
                  );
                  setState(() {
                    _file_sppd = file_sppd;
                  });
                },
                child: Text('GALLERY'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () async {
                  setState(() {
                    _file_sppd = tmpfile;
                    file_sppd = null;
                  });
                },
                child: Text('REMOVE'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              file_sppd == null
                  ? Image.asset(
                      'assets/empty.jpg',
                      width: 100,
                      height: 100,
                    )
                  : Image.file(
                      _file_sppd,
                      width: 100,
                      height: 100,
                    )
            ],
          ),
          Text("2 TIKET"),
          Row(
            children: <Widget>[
              SizedBox(
            width: 30,
            child: Text(isocodetiket, style: TextStyle(color: Colors.green)),
          ),
          SizedBox(
                width: 5,
              ),
          SizedBox(
            width: 275,
            child: TextField(
              controller: tiket_amount,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'tiket amount',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                // border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  file_tiket =
                      await ImagePicker.pickImage(source: ImageSource.camera);
                  setState(() {
                    _file_tiket = file_tiket;
                  });
                },
                child: Text('CAMERA'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () async {
                  file_tiket =
                      await ImagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _file_tiket = file_tiket;
                  });
                },
                child: Text('GALLERY'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () async {
                  setState(() {
                    _file_tiket = tmpfile;
                    file_tiket = null;
                  });
                },
                child: Text('REMOVE'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              file_tiket == null
                  ? Image.asset(
                      'assets/empty.jpg',
                      width: 100,
                      height: 100,
                    )
                  : Image.file(
                      _file_tiket,
                      width: 100,
                      height: 100,
                    )
            ],
          ),
          Text("3 INVOICE"),
          Row(
            children: <Widget>[
              SizedBox(
                width: 30,
                child: InkWell(
                child: Text(isocodeinvoice, style: TextStyle(color: Colors.green)),
                onTap: () {
                  Bantek.goToListCurrency(context);
                },
              ),
              ),
              SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 275,
                child: TextField(
                  controller: invoice_amount,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'invoice amount',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    // border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  file_invoice =
                      await ImagePicker.pickImage(source: ImageSource.camera);
                  setState(() {
                    _file_invoice = file_invoice;
                  });
                },
                child: Text('CAMERA'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () async {
                  file_invoice =
                      await ImagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _file_invoice = file_invoice;
                  });
                },
                child: Text('GALLERY'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () async {
                  setState(() {
                    _file_invoice = tmpfile;
                    file_invoice = null;
                  });
                },
                child: Text('REMOVE'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              file_invoice == null
                  ? Image.asset(
                      'assets/empty.jpg',
                      width: 100,
                      height: 100,
                    )
                  : Image.file(
                      _file_invoice,
                      width: 100,
                      height: 100,
                    )
            ],
          ),
          Text("4 VOUCHER"),
          Row(
            children: <Widget>[
              SizedBox(
            width: 30,
            child: Text(isocodevoucher, style: TextStyle(color: Colors.green)),
          ),
          SizedBox(
                width: 5,
              ),
          SizedBox(
            width: 275,
            child: TextField(
              controller: voucher_amount,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Voucher Amount',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                // border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
            width: 30,
            child: Text(isocodevoucher1, style: TextStyle(color: Colors.green)),
          ),
          SizedBox(
                width: 5,
              ),
          SizedBox(
            width: 275,
            child: TextField(
              controller: voucher_amount1,
              autofocus: false,
              decoration: InputDecoration(
                hintText: "Voucher Amount",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                // border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  file_voucher =
                      await ImagePicker.pickImage(source: ImageSource.camera);
                  setState(() {
                    _file_voucher = file_voucher;
                  });
                },
                child: Text('CAMERA'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () async {
                  file_voucher =
                      await ImagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _file_voucher = file_voucher;
                  });
                },
                child: Text('GALLERY'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () async {
                  setState(() {
                    _file_voucher = tmpfile;
                    file_voucher = null;
                  });
                },
                child: Text('REMOVE'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              file_voucher == null
                  ? Image.asset(
                      'assets/empty.jpg',
                      width: 100,
                      height: 100,
                    )
                  : Image.file(
                      _file_voucher,
                      width: 100,
                      height: 100,
                    )
            ],
          ),
          Text("5 AML"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  file_aml =
                      await ImagePicker.pickImage(source: ImageSource.camera);
                  setState(() {
                    _file_aml = file_aml;
                  });
                },
                child: Text('CAMERA'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () async {
                  file_aml =
                      await ImagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _file_aml = file_aml;
                  });
                },
                child: Text('GALLERY'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () async {
                  setState(() {
                    _file_aml = tmpfile;
                    file_aml = null;
                  });
                },
                child: Text('REMOVE'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              file_aml == null
                  ? Image.asset(
                      'assets/empty.jpg',
                      width: 100,
                      height: 100,
                    )
                  : Image.file(
                      _file_aml,
                      width: 100,
                      height: 100,
                    )
            ],
          ),
          // ACTION
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  String id_bantek = prefs.getString('id_bantek');
                  name = prefs.getString('name');
                  id = prefs.getString('id');
                  if (file_sppd != null) {
                    String base64Image =
                        base64Encode(file_sppd.readAsBytesSync());
                    // String fileName = file_aml.path.split("/").last;
                    http.post(Bantek.url_uploads_sppd, body: {
                      "sppd_image": base64Image,
                      "sppdnumber": sppdnumber.toString(),
                      "id": id.toString(),
                      "id_bantek": id_bantek.toString(),
                    }, headers: {
                      'accept': 'application/json'
                    }).then((res) {
                      print(res.statusCode);
                      print(res.body);
                    }).catchError((err) {
                      print(err);
                    });
                  }
                  if (file_tiket != null) {
                    String base64Image =
                        base64Encode(file_tiket.readAsBytesSync());
                    // String fileName = file_aml.path.split("/").last;

                    http.post(Bantek.url_uploads_tiket, body: {
                      "tiket_image": base64Image,
                      "id": id.toString(),
                      "id_bantek": id_bantek.toString(),
                      "tiket_amount": tiket_amount.text.toString(),
                    }).then((res) {
                      print(res.statusCode);
                      print(res.body);
                    }).catchError((err) {
                      print(err);
                    });
                  }
                  if (file_invoice != null) {                    
                    String base64Image =
                        base64Encode(file_invoice.readAsBytesSync());
                    // String fileName = file_aml.path.split("/").last;
                    http.post(Bantek.url_uploads_invoice, body: {
                      "invoice_image": base64Image,
                      "id": id.toString(),
                      "id_bantek": id_bantek.toString(),
                      "invoice_amount": isocodeinvoice+" "+invoice_amount.text.toString(),
                    }).then((res) {
                      print(res.statusCode);
                      print(res.body);
                    }).catchError((err) {
                      print(err);
                    });
                  }
                  if (file_voucher != null) {
                    String base64Image =
                        base64Encode(file_voucher.readAsBytesSync());
                    // String fileName = file_aml.path.split("/").last;
                    http.post(Bantek.url_uploads_voucher, body: {
                      "voucher_image": base64Image,
                      "id": id.toString(),
                      "id_bantek": id_bantek.toString(),
                      "voucher_amount": voucher_amount.text.toString(),
                      "voucher_amount1": voucher_amount1.text.toString(),
                    }).then((res) {
                      print(res.statusCode);
                      print(res.body);
                    }).catchError((err) {
                      print(err);
                    });
                  }
                  if (file_aml != null) {
                    String base64Image =
                        base64Encode(file_aml.readAsBytesSync());
                    // String fileName = file_aml.path.split("/").last;
                    http.post(Bantek.url_uploads_aml, body: {
                      "aml_image": base64Image,
                      "id": id.toString(),
                      "id_bantek": id_bantek.toString(),
                    }).then((res) {
                      print(res.statusCode);
                      print(res.body);
                      //MyNavigator.goToHomeUser(context);
                    }).catchError((err) {
                      print(err);
                    });
                  }
                  if (file_aml != null ||
                      file_sppd != null ||
                      file_tiket != null ||
                      file_invoice != null ||
                      file_voucher != null) {
                        setState(() {
                          prefs.remove("sppdnumber");
                          prefs.remove("isocode");
                          file_aml=null;
                          file_sppd=null;
                          file_tiket=null;
                          file_invoice=null;
                          file_voucher=null;
                        });
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("Upload Success"),
                        );
                      },
                    );
                    // Bantek.goToHomeUser(context);
                  }
                },
                child: Text('UPLOAD FILE'),
              )
            ],
          ),
        ],
      ),
    ),
    onWillPop: (){
      Bantek.goToHomeUser(context);
    },
    );
  }
}
