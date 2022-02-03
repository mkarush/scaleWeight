import 'package:flutter/material.dart';

class DropDownLabel extends StatelessWidget {
  const DropDownLabel(
      {Key? key,
      required this.label,
      required this.userHintText,
      required this.onChanged,
      required this.myLabelList})
      : super(key: key);

  final String label;
  final String userHintText;
  final List<String> myLabelList;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: label,
              hint: Text(userHintText),
              icon: const Icon(Icons.arrow_drop_down),
              onChanged: onChanged,
              items: myLabelList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
