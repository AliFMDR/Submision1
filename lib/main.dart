import 'package:flutter/material.dart';
import 'package:projek2/Home.dart';
import 'package:projek2/RestaurantDetailPage.dart';
import 'package:projek2/RestaurantListPage.dart';
import 'package:projek2/widget_list_resto.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: RestaurantHomePage()),
    );
  }
}
