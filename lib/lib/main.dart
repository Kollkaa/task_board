import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:task_board/routes/app_pages.dart';
import 'package:task_board/storage/colors/colors_macket.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await GlobalConfiguration().loadFromAsset("configurations.json");

  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: Brightness.light));


  runApp(
      new GetMaterialApp(
        smartManagement: SmartManagement.full,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'EN'), // English, no
          const Locale('ru', 'RU')// country code
        ],
        color: colorBasic0,
        theme: ThemeData(
          primaryColorBrightness: Brightness.light,
          primaryColor: colorBasic0,
          backgroundColor: colorBasic0,
          fontFamily: "Gilroy",
          primarySwatch: Colors.green,
        ),
        defaultTransition: Transition.rightToLeft,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages().getRoutes(),
      )
  );

}

