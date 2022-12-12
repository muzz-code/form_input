import 'package:flutter/material.dart';
import 'package:union_collect/models/product.dart';

class TransactionDetailsStringInputText extends StatelessWidget {
  final String txInput;
  final List<String> genderItems = [
    'Male',
    'Female',
  ];
  final _formKey = GlobalKey<FormState>();
  late final String? selectedValue;

  var editedProd = Product(
      inputProd: '',
      inputEmail: '',
      inputAmount: 0,
      inputPhoneNum: 0,
      inputTransactionDetails: '');

  void _saveForm() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();
    print(editedProd.inputPhoneNum);
    print(editedProd.inputAmount);
    print(editedProd.inputEmail);
    print(editedProd.inputProd);
    print(editedProd.inputTransactionDetails);
  }

  TransactionDetailsStringInputText(
      {Key? key, this.selectedValue, required this.txInput})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.5),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.red,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE2E2EA))),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                hintText: txInput,
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              /** regex validator function **/
              validator: (txInput) {
                if (txInput!.isEmpty ||
                    !RegExp(r'^[a-z A-Z]+$').hasMatch(txInput!)) {
                  return 'Please enter correct $txInput';
                } else {
                  return null;
                }
              },
              onSaved: (txInput) {
                editedProd = Product(
                    inputProd: editedProd.inputProd,
                    inputEmail: editedProd.inputEmail,
                    inputAmount: editedProd.inputAmount,
                    inputPhoneNum: editedProd.inputPhoneNum,
                    inputTransactionDetails: txInput.toString());
              },
              onFieldSubmitted: (_) {
                _saveForm;
              },

            ),
          ],
        ),
      ),
    );
  }
}
