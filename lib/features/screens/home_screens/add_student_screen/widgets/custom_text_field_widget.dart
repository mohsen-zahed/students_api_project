import 'package:flutter/material.dart';
import 'package:students_api_project/utils/media_queries/media_queries.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController textEditingController;
  final Function(String) onChanged;
  const CustomTextFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.textEditingController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MyMediaQueries.instance.getWidthMediaQuery(context, 0.05),
      ),
      child: TextField(
        controller: textEditingController,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
          disabledBorder: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }
}
