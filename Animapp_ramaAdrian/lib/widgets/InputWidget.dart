import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String initialValue;
  final String labelText;
  final String hintText;
  final IconData icon;
  final String validateText;
  final bool enable;
  final bool isPassword;
  final int minLines;
  final int maxLines;
  final int maxLength;
  final Function onChanged;
  final Function onSaved;
  final Function onTap;
  final Function validator;
  final TextInputType keyboardType;

  const InputWidget({
    Key key,
    this.initialValue = '',
    @required this.labelText,
    this.hintText,
    this.keyboardType,
    this.validateText = "Ingrese este campo",
    this.icon,
    this.enable = true,
    this.isPassword = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  InputDecoration _inputDecoration() {
    var _icon = icon != null ? Icon(icon) : null;
    return InputDecoration(
      icon: _icon,
      labelText: labelText,
      hintText: hintText,
      fillColor: Colors.pink
    );
  }
String validatorDefault(String value) => value.isEmpty ? validateText : null;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: keyboardType,
        enabled: enable,
        minLines: minLines,
        maxLines: maxLines,
        maxLength: maxLength,
        obscureText: isPassword,
        initialValue: this.initialValue,
        decoration: _inputDecoration(),
        validator: validator ?? validatorDefault,
        onChanged: onChanged,
        onTap: onTap,
        onSaved: onSaved,
        buildCounter: (BuildContext context,
            {int currentLength, int maxLength, bool isFocused}) {
          return (this.maxLength != null && isFocused)
              ? Text('$currentLength/$maxLength ',
                  style: new TextStyle(fontSize: 10.0))
              : null;
        });
  }
}