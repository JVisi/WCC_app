import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wccapp/config/core.dart';
import 'package:wccapp/userAuth/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) =>
      runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),

      ///check memory
    );
  }
}
