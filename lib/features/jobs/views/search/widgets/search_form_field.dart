import 'package:flutter/material.dart';
import 'package:job_scraper/utils/constants/colors.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    super.key,
    required this.hint,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.filled = false,
    this.enabled = true,
    this.autofocus = false,
  });

  final String hint;
  final bool filled;
  final bool enabled;
  final bool autofocus;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      controller: controller,
      onChanged: onChanged,
      style: Theme.of(context).textTheme.bodyLarge!.apply(decoration: TextDecoration.none),
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.darkGrey),
        filled: filled,
        enabled: enabled,
      ),
    );
  }
}
