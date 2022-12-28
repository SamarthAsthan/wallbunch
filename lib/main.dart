import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wallbunch/mainmenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.red,
            scaffoldBackgroundColor: Colors.black, //<-- SEE HERE
          ),
          debugShowCheckedModeBanner: false,
          home: const Scaffold(
            backgroundColor: Colors.black,
            body: MainMenu(),
          ),
        );
      },
    );
  }
}
