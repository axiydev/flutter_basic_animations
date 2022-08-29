import 'package:flutter/material.dart';
import 'package:flutter_basic_animations/pages/flip/flip_page.dart';
import 'package:flutter_basic_animations/pages/home/home_page.dart';
import 'package:flutter_basic_animations/pages/other/other_page.dart';

/*
Created by Axmadjon Isaqov on 09:23:07 29.08.2022
© 2022 @axi_dev 
*/
/*
Mavzu:::Animations Basics
*/
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => const HomePage(),
        '/other': (context) => const OtherPage(),
        '/flip': (context) => const FlipPage()
      },
      initialRoute: '/home',
    );
  }
}
