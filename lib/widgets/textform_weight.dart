import 'package:bloc_scale_weight/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormWeight extends StatelessWidget {
  const TextFormWeight(
      {Key? key,
      required this.initialValue,
      required this.onChanged,
      required this.labelUserText,
      required this.maxAllowedLength})
      : super(key: key);

  final String initialValue;
  final String labelUserText;
  final Function(String?) onChanged;
  final int maxAllowedLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          maxLength: maxAllowedLength,
          decoration: InputDecoration(
            focusedBorder: focusedBorderStyle,
            enabledBorder: enableBorderStyle,
            labelText: labelUserText,
          ),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          initialValue: initialValue,
          onChanged: onChanged),
    );
  }
}
