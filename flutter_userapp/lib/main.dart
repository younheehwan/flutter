import 'package:flutter/material.dart';
import 'package:flutter_userapp/pages/fda_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FdaHome(), debugShowCheckedModeBanner: false);
  }
}
