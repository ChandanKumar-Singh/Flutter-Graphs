import 'package:flutter/material.dart';
import 'package:flutter_graphs/widgets/cartesianChart.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Graphs',
      theme: ThemeData(
        primaryColor: Colors.pink,
        brightness: Brightness.dark

      ),
      home: const CartesianCharts(),
    );
  }
}
