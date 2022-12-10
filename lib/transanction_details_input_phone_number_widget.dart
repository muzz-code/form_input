import 'package:flutter/material.dart';

class TransactionDetailsPhoneNumberInputText extends StatelessWidget {
  final String inputNumber;

  const TransactionDetailsPhoneNumberInputText(
      {Key? key, required this.inputNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE2E2EA))),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              hintText: inputNumber,
              hintStyle: const TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            /** regex validator function **/
            validator: (value) {
              if (value!.isEmpty || !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$').hasMatch(value!)) {
                return 'Please enter correct $inputNumber';
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
