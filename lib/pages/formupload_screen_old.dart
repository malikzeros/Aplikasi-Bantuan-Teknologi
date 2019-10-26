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
File file_aml,file_sppd,file_invoice,file_tiket,file_voucher;
File _file_aml,_file_sppd,_file_invoice,_file_tiket,_file_voucher;
String name,id;
// String tiket_amount,invoice_amount,voucher_amount;
TextEditingController tiket_amount  = TextEditingController();
TextEditingController invoice_amount  = TextEditingController();
TextEditingController voucher_amount = TextEditingController();
class _FormUploadState extends State<FormUpload> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,title: Text("Form Uploads"),),
      body: ListView(
	  shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
		SizedBox(height: 48.0),
          Text("1 SPPD"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  file_sppd = await ImagePicker.pickImage(source: ImageSource.camera, maxHeight: 100,maxWidth: 100,);
				  setState(() {
                  _file_sppd=file_sppd;
                  });
                },
                child: Text('CAMERA'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () async {
				file_sppd = await ImagePicker.pickImage(source: ImageSource.gallery, maxHeight: 100,maxWidth: 100,);
                  setState(() {
                  _file_sppd=file_sppd;
                  });
                },
                child: Text('GALLERY'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            file_sppd== null? Image.asset('assets/empty.jpg',width:100 ,height: 100,): 
			Image.file(_file_sppd,width:100 ,height: 100,)
          ],),
          Text("2 TIKET"),
          SizedBox(
            width: 190,
            child: TextField(
              controller: tiket_amount,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Rp/dollar tiket amount',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),),            
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
				file_tiket = await ImagePicker.pickImage(source: ImageSource.camera);
                  setState(() {
                  _file_tiket=file_tiket;
                  });
                },
                child: Text('CAMERA'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () async {
				file_tiket = await ImagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                  _file_tiket=file_tiket;
                  });
                },
                child: Text('GALLERY'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            file_tiket == null
            ? Image.asset('assets/empty.jpg',width:100 ,height: 100,) 
            : Image.file(_file_tiket,width:100 ,height: 100,)
          ],),
          Text("3 INVOICE"),
          SizedBox(
            width: 190,
            child: TextField(
                controller: invoice_amount,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Rp/dollar invoice amount',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),),            
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  file_invoice = await ImagePicker.pickImage(source: ImageSource.camera);
                  setState(() {
                  _file_invoice=file_invoice;
                  });
                },
                child: Text('CAMERA'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () async {
                  file_invoice = await ImagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                  _file_invoice=file_invoice;
                  });
                },
                child: Text('GALLERY'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            file_invoice == null
            ? Image.asset('assets/empty.jpg',width:100 ,height: 100,) 
            : Image.file(_file_invoice,width:100 ,height: 100,)
          ],),
          Text("4 VOUCHER"),
          SizedBox(
            width: 190,
            child: TextField(
                controller: voucher_amount,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Rp/dollar voucher amount',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),),            
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  file_voucher = await ImagePicker.pickImage(source: ImageSource.camera);
                  setState(() {
                  _file_voucher=file_voucher;
                  });
                },
                child: Text('CAMERA'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () async {
				file_voucher = await ImagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                  _file_voucher=file_voucher;
                  });
                },
                child: Text('GALLERY'),
              ),
         
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            file_voucher == null
            ? Image.asset('assets/empty.jpg',width:100 ,height: 100,) 
            : Image.file(_file_voucher,width:100 ,height: 100,)
          ],),
          Text("5 AML"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  file_aml = await ImagePicker.pickImage(source: ImageSource.camera);
                  setState(() {
                  _file_aml=file_aml;
                  });
                },
                child: Text('CAMERA'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () async {
                  file_aml = await ImagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                  _file_aml=file_aml;
                  });
                },
                child: Text('GALLERY'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            file_aml == null
            ? Image.asset('assets/empty.jpg',width:100 ,height: 100,)
            : Image.file(_file_aml,width:100 ,height: 100,)
          ],),
          // ACTION
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  String id_bantek=prefs.getString('id_bantek');
                  name=prefs.getString('name');
                  id=prefs.getString('id');
                  if(file_sppd !=null){
                    String base64Image = base64Encode(file_sppd.readAsBytesSync());
                  // String fileName = file_aml.path.split("/").last;
                  http.post(Bantek.url_uploads_sppd, body: {
                    "sppd_image": base64Image,
                    "id": id,
                    "id_bantek": id_bantek,
                  }).then((res) {
                    print(res.statusCode);
                    print(res.body);
                  }).catchError((err) {
                    print(err);
                  });
                  } 
                  if(file_tiket !=null){
                    String base64Image = base64Encode(file_tiket.readAsBytesSync());
                  // String fileName = file_aml.path.split("/").last;
                  
                  http.post(Bantek.url_uploads_tiket, body: {
                    "tiket_image": base64Image,
                    "id": id,
                    "id_bantek": id_bantek,
                    "tiket_amount": tiket_amount.text,
                  }).then((res) {
                    print(res.statusCode);
                    print(res.body);
                  }).catchError((err) {
                    print(err);
                  });
                  } 
                  if(file_invoice !=null){
                    String base64Image = base64Encode(file_invoice.readAsBytesSync());
                  // String fileName = file_aml.path.split("/").last;
                  http.post(Bantek.url_uploads_invoice , body: {
                    "invoice_image": base64Image,
                    "id": id,
                    "id_bantek": id_bantek,                    
                    "invoice_amount": invoice_amount.text,
                  }).then((res) {
                    print(res.statusCode);
                    print(res.body);
                  }).catchError((err) {
                    print(err);
                  });
                  } 
                  if(file_voucher !=null){
                    String base64Image = base64Encode(file_voucher.readAsBytesSync());
                  // String fileName = file_aml.path.split("/").last;
                  http.post(Bantek.url_uploads_voucher , body: {
                    "voucher_image": base64Image,
                    "id": id,
                    "id_bantek": id_bantek,
                    "voucher_amount": voucher_amount.text,
                  }).then((res) {
                    print(res.statusCode);
                    print(res.body);
                  }).catchError((err) {
                    print(err);
                  });
                  } 
                  if(file_aml !=null){
                    String base64Image = base64Encode(file_aml.readAsBytesSync());
                  // String fileName = file_aml.path.split("/").last;
                  http.post(Bantek.url_uploads_aml, body: {
                    "aml_image": base64Image,
                    "id": id,
                    "id_bantek": id_bantek,
                  }).then((res) {
                    print(res.statusCode);
                    print(res.body);					
					//MyNavigator.goToHomeUser(context);
                  }).catchError((err) {
                    print(err);
                  });
                  }   
				  if(file_aml !=null || file_sppd !=null || file_tiket !=null || file_invoice !=null || file_voucher !=null ){
				  return showDialog(context: context,builder: (context) {return AlertDialog(content: Text("Upload Success"),);},); 
				  }                         
                },
                child: Text('UPLOAD FILE'),
              )
            ],
          ),
        ],
      ),
    );
  }
}