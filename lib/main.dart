import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_ai/core/bloc/auth_cubit/auth_login_cubit.dart';
import 'package:school_ai/core/utils/app_router.dart';
import 'package:school_ai/core/utils/service_locator.dart';
import 'package:school_ai/data/data_sources/hive_helper.dart';
import 'package:school_ai/data/repositories/auth_repo/login_repo_impl.dart';
import 'package:school_ai/old/constants.dart';
import 'package:school_ai/old/controllers/MenuAppController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // تهيئة HiveHelper
  await HiveHelper.init();
  setup();
  runApp(SchoolAI());
}

class SchoolAI extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuAppController(),
        ),
        BlocProvider(
          create: (context) => AuthLoginCubit(
            getIt.get<LoginRepoImpl>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'School_AI',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
      ),
    );
  }
}
