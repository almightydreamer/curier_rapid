import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dependency_injection/dependency_injection.dart' as di;

void main() {
  di.init();
  runApp(const CurierRapidApp());
}

class CurierRapidApp extends StatelessWidget {
  const CurierRapidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Curier Rapid',
        theme: ThemeData(
          canvasColor: Colors.transparent,
        ),
        home: Container());
  }
}
