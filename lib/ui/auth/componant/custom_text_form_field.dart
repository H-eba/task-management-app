import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String lable;
  TextInputType keybordType;
  TextEditingController controller;
  String? Function(String?) validator;

  CustomTextFormField({
    required this.lable,
    required this.controller,
    required this.validator,
    this.keybordType=TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(label: Text(lable),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color:Colors.blue,
          width: 2)
        ),
        focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color:Colors.blue,
                width: 2)
        ),
        focusedErrorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color:Colors.red,
                width: 2)
        ),
         errorBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color:Colors.red,
                  width: 2)
          ),
        ),
        keyboardType: keybordType,
        controller: controller,
        validator:validator ,
      ),
    );
  }
}
