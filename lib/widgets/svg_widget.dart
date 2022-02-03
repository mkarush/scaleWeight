import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWidget extends StatelessWidget {
  const SvgWidget({Key? key, required this.file}) : super(key: key);

  final String file;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(file);
  }
}
