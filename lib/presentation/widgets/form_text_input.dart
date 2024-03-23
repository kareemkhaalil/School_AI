import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormTextInput extends StatelessWidget {
  FormTextInput({
    Key? key,
    required this.width,
    this.textDirection = TextDirection.rtl,
    this.textAlign = TextAlign.right,
    this.fontSize = 20,
    this.fontFamily = 'cairo', // تعديل هنا
    this.fontWeight = FontWeight.w500,
    this.textColor = Colors.black,
    this.hintText = 'الاسم بالكامل',
    this.hintTextDirection = TextDirection.rtl,
    this.hintFontSize = 18,
    this.hintFontFamily = 'cairo', // تعديل هنا
    this.hintFontWeight = FontWeight.w500,
    this.hintTextColor = Colors.black45,
    this.borderColor = Colors.green,
    this.borderRadius = 12,
    this.focusedBorderColor = Colors.black38,
    this.errorBorderColor = Colors.black87,
    this.validator,
    this.onChange,
    this.type,
    this.inputFormatters,
    this.onEditingComplete,
    this.controller,
    this.readOnly = false,
  }) : super(key: key);

  final double width;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final Color textColor;
  final String hintText;
  final TextDirection hintTextDirection;
  final double hintFontSize;
  final String hintFontFamily;
  final FontWeight hintFontWeight;
  final Color hintTextColor;
  final Color borderColor;
  final double borderRadius;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  final TextInputType? type;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onEditingComplete;
  final TextEditingController? controller;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: width * 0.2,
          child: TextFormField(
            controller: controller,
            textDirection: textDirection,
            textAlign: textAlign,
            inputFormatters: inputFormatters,
            keyboardType: type,
            readOnly: readOnly,
            onEditingComplete: onEditingComplete,
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
              color: textColor,
            ),
            validator: validator,
            onChanged: (value) {
              if (onChange != null) {
                onChange!(value);
              }
            },
            decoration: InputDecoration(
              hintText: hintText,
              fillColor: Colors.grey[200],
              hintTextDirection: hintTextDirection,
              filled: true,
              hintStyle: TextStyle(
                fontSize: hintFontSize,
                fontFamily: hintFontFamily,
                fontWeight: hintFontWeight,
                color: hintTextColor,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: focusedBorderColor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorBorderColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.01,
        ),
        Text(
          hintText,
          style: TextStyle(
            fontSize: 22,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            color: textColor.withOpacity(0.8),
          ),
        ),
        Container(
          color: Colors.red,
          width: width * 0.01,
        ),
      ],
    );
  }
}
