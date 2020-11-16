import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpFormField extends StatelessWidget {
  ExpFormField(
      {@required this.hintText,
      @required this.labelText,
      @required this.prefixIcon,
      this.maxLength = null,
      @required this.validator,
      @required this.onSaved,
      this.keyboardType});
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final int maxLength;
  final String Function(String) validator;
  final void Function(String) onSaved;
  final TextInputType keyboardType;

  final Color _borderColor = Color(0xff681313);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 10, 10),
      child: TextFormField(
        toolbarOptions: ToolbarOptions(
          selectAll: true,
          copy: true,
          paste: true,
          cut: true,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: _borderColor)),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: _borderColor)),
          prefixIcon: Icon(prefixIcon, color: Colors.black),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(color: _borderColor),
          labelStyle: TextStyle(color: _borderColor),
        ),
        maxLength: maxLength,
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black),
        validator: validator,
        onSaved: onSaved,
        keyboardType: keyboardType,
      ),
    );
  }
}
