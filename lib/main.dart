import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/homeprovider.dart';
import 'screens/competition.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recruitment Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Competions(),
    );
  }
}
