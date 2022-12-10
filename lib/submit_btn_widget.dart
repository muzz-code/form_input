import 'package:flutter/material.dart';

class SubmitBtn extends StatelessWidget {
  final String submitBtnText;
  final Function onPressed;

  const SubmitBtn({Key? key, required this.submitBtnText, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(onPressed: () {
            onPressed();
          }, child: Text(submitBtnText))),
    );
  }
}
