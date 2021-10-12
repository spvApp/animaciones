import 'package:animaciones/pages/box2_page.dart';
import 'package:animaciones/pages/box_page.dart';
import 'package:animaciones/pages/images_page.dart';
import 'package:animaciones/pages/page_register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Animaciones',
      debugShowCheckedModeBanner: false, //saca el cartel de "DEBUG"
      initialRoute: ImagesPage.ROUTE,
      theme: ThemeData(primaryColor: Colors.purple, accentColor: Colors.orange),
      routes: {
        LoginRegister.ROUTE: (_) => LoginRegister(),
        BoxPage.ROUTE: (_) => BoxPage(),
        Box2Page.ROUTE: (_) => Box2Page(),
        ImagesPage.ROUTE: (_) => ImagesPage(),
      },
    );
  }
}
