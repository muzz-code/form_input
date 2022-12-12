import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:union_collect/choose_collection_drop_down_page.dart';
import 'package:union_collect/transaction_details_input_string_text_widget.dart';
import 'package:union_collect/transaction_details_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TransactionDetailsPage(),
    );
  }
}
