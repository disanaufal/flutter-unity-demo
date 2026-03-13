import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../features/home/presentation/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        //* makes status bar transparent
        statusBarColor: Colors.transparent,

        //* white icons (clock, battery, signal)
        statusBarIconBrightness: Brightness.light,

        //* iOS support
        statusBarBrightness: Brightness.dark,
      ),

      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}