import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String initialValue;
  final String labelText;
  final String hintText;
  final IconData icon;
  final String validateText;
  final bool enable;
  final int minLines;
  final int maxLines;
  final int maxLength;
  final Function onChanged;
  final Function onSaved;

  const InputWidget({
    Key key,
    this.initialValue = '',
    @required this.labelText,
    this.hintText,
    this.validateText = "Ingrese este campo",
    this.icon,
    this.enable = true,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.onSaved,
  }) : super(key: key);

  InputDecoration _inputDecoration() {
    var _icon = icon != null ? Icon(icon) : null;
    return InputDecoration(
      icon: _icon,
      labelText: labelText,
      hintText: hintText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: enable,
        minLines: minLines,
        maxLines: maxLines,
        maxLength: maxLength,
        initialValue: this.initialValue,
        decoration: _inputDecoration(),
        validator: (value) => value.isEmpty ? validateText : null,
        onChanged: onChanged,
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