import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:wccapp/Web/register.dart';
import 'package:wccapp/config/core.dart';
import 'package:wccapp/config/lang/locals.dart';
import 'package:wccapp/config/loader.dart';
import 'package:wccapp/config/model.dart';
import 'package:wccapp/models/user.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterState();
}

class RegisterState extends State<RegisterScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  final password2 = TextEditingController();
  bool keepLoginData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email.addListener(checkEmail);
    password.addListener(checkPassword);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/Images/background/Rem.jpg"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*10),
              child: ListView(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white.withOpacity(0.9)),
                      child: AspectRatio(
                        aspectRatio: SizeConfig.blockSizeVertical,
                        child: TextFormField(
                          style: themeConfig().textTheme.bodyText1,
                          decoration: InputDecoration(
                              hintText: AppLocalizations.of(context).email,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 10)),
                          controller: this.email,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white.withOpacity(0.9)),
                      child: AspectRatio(
                        aspectRatio: SizeConfig.blockSizeVertical,
                        child: TextFormField(
                          style: themeConfig().textTheme.bodyText1,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: AppLocalizations.of(context).password,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 10)),
                          controller: this.password,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white.withOpacity(0.9)),
                      child: AspectRatio(
                        aspectRatio: SizeConfig.blockSizeVertical,
                        child: TextFormField(
                          style: themeConfig().textTheme.bodyText1,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: AppLocalizations.of(context).password,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 10)),
                          controller: this.password2,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () => saveLogin(!keepLoginData),
                            child: Text(
                                AppLocalizations.of(context).saveLoginData,
                                style: themeConfig().textTheme.bodyText1)),
                        Checkbox(
                            value: keepLoginData,
                            onChanged: (bool _val) => saveLogin(_val)),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.6)),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(AppLocalizations.of(context).haveAccount,
                            style: themeConfig().textTheme.bodyText1),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.blockSizeVertical * 5),
                    child: Row(
                      children: <Widget>[
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 3,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: Colors.black)),
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                  AppLocalizations.of(context).registerButton,
                                  style: themeConfig().textTheme.bodyText1),
                            ),
                            onPressed: () async {
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingHandler<String>(future: bela, succeeding: (String data) {print(data);return Scaffold(body: Text(data));},)));
                              if (checkEmail() && checkPassword()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => register(
                                            this.email.text,
                                            this.password.text,
                                            keepLoginData,
                                            context)));
                              }
                            },
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  register(String email, String password, bool keepLogin, BuildContext context,
      [Widget onError]) {
    return LoadingHandler<User>(
      future: RequestRegister(
              email: email, password: password, keepLogin: keepLogin)
          .send,
      succeeding: (User data) {
        AppModel.of(context).setUser(data);
        return Scaffold(
          body: Text(AppModel.of(context).getUser().email),
        );
      },
      onError: onError,
      needReloadButton: true,
    );
  }

  void saveLogin(bool val) {
    setState(() {
      keepLoginData = val;
    });
  }

  bool checkEmail() {
    print(this.email.text);
    return true;
  }

  bool checkPassword() {
    return true;
  }
}
