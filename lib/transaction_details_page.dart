import 'package:flutter/material.dart';
import 'package:union_collect/transaction_details_input_amount_text_widget.dart';
import 'package:union_collect/transaction_details_input_string_text_widget.dart';
import 'package:union_collect/transanction_details_input_phone_number_widget.dart';

import 'choose_collection_drop_down_widget_real.dart';
import 'choose_collection_text_widget.dart';

class TransactionDetailsPage extends StatelessWidget {
  final List<String> transactionList = [
    'nepa bills',
    'school fees',
    'plumbing services',
    'grocery supplies'
  ];

  final _formKey = GlobalKey<FormState>();

  /// saves the input of the form when the submit is triggered
  void _saveForm () {
    _formKey.currentState?.save();
  }

  TransactionDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text('Union collect'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CollectionText(cTxt: 'Transaction details'),
                  DropDownForm(transactionList, someFunction: (){}, hint: 'transaction details'),
                  TransactionDetailsStringInputText(txInput: 'Insured name'),
                  const TransactionDetailsAmountInputText(
                    inputNumber: 'Amount',
                  ),
                  TransactionDetailsStringInputText(txInput: 'Narration'),
                  const SizedBox(
                    height: 15,
                  ),
                  const CollectionText(cTxt: 'Collection details'),
                  TransactionDetailsStringInputText(txInput: 'input'),
                  const TransactionDetailsAmountInputText(
                    inputNumber: 'Insured name',
                  ),
                  const TransactionDetailsPhoneNumberInputText(
                    inputNumber: 'Telephone number',
                  ),
                  TransactionDetailsStringInputText(txInput: 'Payment period'),
                  const TransactionDetailsAmountInputText(
                      inputNumber: 'Policy No.'),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()){
                                _formKey.currentState!.save();
                              }
                              _saveForm;
                            },
                            child: const Text('submit'))),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
