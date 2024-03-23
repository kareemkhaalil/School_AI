import 'package:flutter/material.dart';

class CustomDropdownFormField<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final String hintText;
  final double width;
  final double height;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final Color hintTextColor;
  final Color borderColor;
  final double borderRadius;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final IconData? icon;
  final bool isExpanded;
  final String? Function(T?)? validator;

  const CustomDropdownFormField(
      {Key? key,
      required this.value,
      required this.items,
      required this.onChanged,
      required this.hintText,
      required this.width,
      required this.height,
      this.fontFamily = 'cairo',
      this.fontSize = 20,
      this.fontWeight = FontWeight.w500,
      this.textColor = Colors.black,
      this.hintTextColor = Colors.black45,
      this.borderColor = Colors.green,
      this.borderRadius = 12,
      this.focusedBorderColor = Colors.black38,
      this.errorBorderColor = Colors.black87,
      this.icon,
      this.isExpanded = true,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.1,
      child: DropdownButtonFormField<T>(
        alignment: Alignment.center,
        validator: validator,
        value: value,
        onChanged: onChanged,
        items: items,
        iconDisabledColor: Colors.black87,
        iconEnabledColor: Colors.black87,
        dropdownColor: Colors.grey[200],
        style: TextStyle(
          fontSize: 14,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: textColor,
        ),
        decoration: InputDecoration(
          helperMaxLines: 2,
          hintText: hintText,
          fillColor: Colors.grey[200],
          filled: true,
          hintStyle: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            color: hintTextColor,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedBorderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: errorBorderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          suffixIcon: icon != null ? Icon(icon) : null,
        ),
        isExpanded: isExpanded,
      ),
    );
  }
}
