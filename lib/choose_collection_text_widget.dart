import 'package:flutter/material.dart';

class CollectionText extends StatelessWidget {
  final String cTxt;

  const CollectionText({Key? key, required this.cTxt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(cTxt));
  }
}
