import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String searchTerm) onChanged;
  final VoidCallback onDismiss;
  final String hintText;
  final Color borderColor;
  final Color textColor;
  final Color backgroundColor;
  final EdgeInsets padding;
  final double borderRadius;

  const CustomSearchBar({
    super.key,
    required this.searchController,
    required this.onChanged,
    required this.onDismiss,
    this.hintText = "Search Here",
    this.borderColor = const Color(0xff686464),
    this.textColor = const Color(0xff686464),
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              onChanged: onChanged,
              decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  hintStyle: FormBuilderTextStyle.normal10style.copyWith(
                    fontSize: 14,
                    color: textColor,
                  ),
                  hintText: hintText),
            ),
          ),
          InkWell(
            onTap: searchController.text.isEmpty ? null : onDismiss,
            child: Icon(
              searchController.text.isEmpty ? Icons.search : Icons.close,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
