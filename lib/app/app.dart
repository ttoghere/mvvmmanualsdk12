import 'package:flutter/material.dart';
import 'package:mvvmmanualsdk12/presentation/resources/resources_shelf.dart';

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key); // The default constructor
  const MyApp._internal(); //Private named constructor
  static const MyApp instance =
      MyApp._internal(); //Single instance -- Singleton
  factory MyApp() => instance; //Factory class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      theme: getApplicationTheme(),
      initialRoute: Routes.splashRoute,
    );
  }
}
