import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wccapp/config/core.dart';
import 'package:wccapp/config/loader.dart';
import 'package:wccapp/config/model.dart';
import 'package:wccapp/userAuth/login.dart';
import 'package:scoped_model/scoped_model.dart';

import 'config/lang/locals.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    final appModel = AppModel();
    runApp(ScopedModel<AppModel>(model: appModel, child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale('hu', 'HU'), Locale('en', 'US')],
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Start(),

    );
  }
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoadingHandler<Map<String, String>>(
      future: AppModel.of(context).loadLogin,
      succeeding: (Map<String, String> data) {
        if (data["email"] != null && data["password"] != null) {
          return LoginState().login(
              data["email"], data["password"], false, context, LoginScreen());
        }
        return LoginScreen();
      },
    );
  }
}
