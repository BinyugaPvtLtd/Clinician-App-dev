import 'package:clinician_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CommonDivider extends StatelessWidget {
  final Color? color;
  const CommonDivider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(color: color ?? AppColors.iconGrey, height: 0);
  }
}
