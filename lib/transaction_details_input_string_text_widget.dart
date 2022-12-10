import 'package:flutter/material.dart';

class TransactionDetailsStringInputText extends StatelessWidget {
  final String txInput;

  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  late final String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  TransactionDetailsStringInputText(
      {Key? key, this.selectedValue, required this.txInput})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.5),
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
            validator: (value) {
              if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                return 'Please enter correct $txInput';
              } else {
                return null;
              }
            },
          ),
        ],
      ),
    );
  }
}
