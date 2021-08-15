import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:yellow_class_proj/Screens/HomeScreen.dart';
import 'movie_model.dart';
import 'package:path_provider/path_provider.dart';

import 'package:hive_flutter/hive_flutter.dart';
const String todoBoxName = "todo";

void main() async{
  await Hive.initFlutter();
   Hive.registerAdapter(MovieModelAdapter());
  await Hive.openBox('movieData');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}