import 'package:flutter/material.dart';
// import 'package:flutter_iti/day_1/ui/login.dart';
import 'package:flutter_iti/day_1/ui/messenger.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(



        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: FacebookMessengerScreen(),
    );
  }
}

