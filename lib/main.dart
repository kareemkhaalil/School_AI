import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_ai/data/repositories/auth_repo/login_repo_impl.dart';

import 'package:school_ai/old/constants.dart';
import 'package:school_ai/old/controllers/MenuAppController.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_ai/presentation/views/Auth/sign_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LoginRepoImpl().login("admin", "12345");
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'School_AI1',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        home: MultiBlocProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => MenuAppController(),
            ),
          ],
          child: SignInScreen(),
        ));
  }
}
