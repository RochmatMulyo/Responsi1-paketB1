 import 'dart:io';

import 'package:flutter/material.dart';
 import 'package:responsi1/ui/tugas_page.dart';

 void main() {
  HttpOverrides.global = MyHttpOverrides();
 runApp(const MyApp());
 }

 class MyApp extends StatefulWidget {
 const MyApp({Key? key}) : super(key: key);

 @override
 _MyAppState createState() => _MyAppState();
 }

 class _MyAppState extends State<MyApp> {
 Widget page = const CircularProgressIndicator();

 @override
 void initState() {
 super.initState();
 page= TugasPage();
 }



 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 title: 'RESPONSI 1',
 debugShowCheckedModeBanner: false,
 home: page,
 );
 }
 }

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}