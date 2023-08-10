import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:placesearch/constants.dart';
import 'package:placesearch/screens/location_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Devhubspot',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
         bodyMedium: TextStyle(color: secondaryColor40LightTheme)
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          toolbarTextStyle: TextStyle(color: textColorLightTheme)
        ),
        // inputDecorationTheme: const InputDecorationTheme(
        //   contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
        //   fillColor: secondaryColor5LightTheme,
        //   filled: true,
        // ),
        primarySwatch: Colors.blue,
      ),
      home: const SearchLocation(),
    );
  }
}