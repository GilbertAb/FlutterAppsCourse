import 'package:flutter/material.dart';
import 'package:mapbox_app/src/screens/fullscreen_map.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'fullmap',
      routes: {'fullmap': (_) => FullScreenMap()},
    );
  }
}
