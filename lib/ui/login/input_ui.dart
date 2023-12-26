import 'package:flutter/material.dart';

class InputUI {

  static InputDecoration loginInput ({
    String? hintText,
    String? labelText,
    Color? colorBorder,
    IconData? icon
  }) {

    hintText ??= 'john.doe@gmail.com';
    labelText ??= 'Correo electrónico';
    colorBorder ??= const Color.fromARGB(195, 164, 6, 6);
    icon ??= Icons.alternate_email_sharp;

    final InputBorder outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: colorBorder)
    );

    final TextStyle labelStyle = TextStyle(color: colorBorder);
                  
    return InputDecoration(
     filled: false,
     enabledBorder: outlineInputBorder,
     focusedBorder: outlineInputBorder,

     hintText: hintText,
     labelText: labelText,
     labelStyle: labelStyle,
     prefixIcon: Icon(icon)
    );
  }
}