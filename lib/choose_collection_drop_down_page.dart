import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:union_collect/models/service.dart';
import 'package:union_collect/submit_btn_widget.dart';
import 'package:union_collect/transaction_details_page.dart';


import 'choose_collection_drop_down_widget_real.dart';

class ChooseCollectionPage extends StatefulWidget {
  const ChooseCollectionPage({Key? key}) : super(key: key);

  @override
  State<ChooseCollectionPage> createState() => _ChooseCollectionPageState();
}

class _ChooseCollectionPageState extends State<ChooseCollectionPage> {

  List<String> dropDownListData = [];
  String? dLink;
  String? defaultValue = "";
  String txt = "";

  Future<void> readJson() async {
    final String response = await DefaultAssetBundle.of(context).loadString('assets/json/merchant.json');
    final data = await jsonDecode(response);
    final List<String> serviceList = [];

    setState(() {
      for (var element in (data["services"] as List<dynamic>)) {
        serviceList.add(element["serviceName"] as String);
      }
      dropDownListData = serviceList;
    });
  }

  @override
  void initState() {

    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text('Union collect'),
      ),
      body: Column(
        children: <Widget>[
           Container(
             margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 30,
              child: const Padding(
                child: Text(
                  'Collection details',
                  style: TextStyle(color: Color(0xff2C2C2C), fontSize: 12),
                ),
                padding: EdgeInsets.only(left: 20),
              )),
          DropDownForm(
            dropDownListData,
            someFunction: (){},
            hint: 'Chosen collection',
            selectedValue: txt,
          ),
          const SizedBox(
            width: double.infinity,
            height: 487,
          ),
           SubmitBtn(submitBtnText: 'Proceed',
          onPressed: (){
              if(Service.selectedService == "ST JOHN COLLEGE"){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  TransactionDetailsPage()),
                );
                //
              }

          },),

        ],
      ),
    );
  }
}
