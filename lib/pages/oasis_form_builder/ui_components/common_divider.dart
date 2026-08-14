import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';

class CommonDivider extends StatelessWidget {
  final Color? color;
  const CommonDivider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppColors.iconGrey,
      height: 0,
    );
  }
}
