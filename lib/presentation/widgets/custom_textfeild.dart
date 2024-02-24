import 'package:flutter/material.dart';
import 'package:school_ai/core/utils/constants.dart';
import 'package:school_ai/presentation/widgets/wizard.dart';

class CustomTextField extends StatelessWidget {
  final double borderradius;
  final Color bordercolor;
  final TextEditingController? controller;
  final double widh;
  final double height;
  final IconData icon;
  final Color iconColor;
  final String hinttext;
  final Color hintColor;
  final Color? onlyborder;
  final double fontsize;
  final Color? textcolor;
  //final FontWeight fontweight;
  final bool obscureText;
  final Function? onTap;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? errorText;

  const CustomTextField({
    Key? key,
    required this.borderradius,
    required this.bordercolor,
    this.controller,
    required this.widh,
    required this.height,
    required this.icon,
    required this.iconColor,
    required this.hinttext,
    required this.hintColor,
    this.onlyborder,
    required this.fontsize,
    this.textcolor,
    required this.obscureText,
    this.onTap,
    this.validator,
    this.onChanged,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: onlyborder ?? Colors.transparent),
            borderRadius: BorderRadius.circular(borderradius),
            color: bordercolor,
          ),
          width: MediaQuery.of(context).size.width * widh,
          height: MediaQuery.of(context).size.height * height,
          child: TextFormField(
            onChanged: onChanged,
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
                hintText: hinttext,
                errorText: errorText,
                hintStyle: TextStyle(
                  fontFamily: cairo,
                  fontWeight: FontWeight.w200,
                  color: hintColor,
                  fontSize: fontsize,
                ),
                border: InputBorder.none),
            obscureText: obscureText,
            style: TextStyle(
              color: textcolor ?? hintColor,
            ),
          ),
        ),
        WSizedBox(wval: 0.01, hval: 0),
        hinttext == "password"
            ? InkWell(
                onTap: onTap as void Function(),
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              )
            : Icon(
                icon,
                color: iconColor,
              ),
      ],
    );
  }
}
