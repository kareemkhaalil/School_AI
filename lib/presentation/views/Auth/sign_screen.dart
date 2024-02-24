import 'package:flutter/material.dart';
import 'package:school_ai/old/responsive.dart';
import 'package:school_ai/presentation/views/Auth/sign_DesktopBody.dart';
import 'package:school_ai/presentation/views/Auth/sign_MobileBody.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        desktop: DesktopBody(),
        mobile: MobileBody(),
      ),
    );
  }
}
