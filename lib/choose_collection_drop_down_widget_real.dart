import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:union_collect/submit_btn_widget.dart';

import 'models/service.dart';

class DropDownForm extends StatelessWidget {
  final List<String> genderItems;
  late final String? selectedValue;
  late final String hint;
  final Function someFunction;



  DropDownForm(this.genderItems, {Key? key, this.selectedValue, required this.hint, required this.someFunction}): super(key: key);

  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            DropdownButtonFormField2(
              onChanged: ( itemSelected) {
                String val = itemSelected as String;
                Service.setSelectedService(val);
              },
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE2E2EA))),
                //Add isDense true and zero Padding.
                //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                //Add more decoration as you want here
                //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
              ),
              isExpanded: true,
              hint: Text(hint),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 30,
              buttonHeight: 60,
              buttonPadding: const EdgeInsets.only(left: 20, right: 10),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              items: genderItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select gender.';
                }
              },
              onSaved: (value) {
                selectedValue = value.toString();
              },


            ),
            const SizedBox(height: 12.5),
          ],
        ),
      ),
    );
  }
}

