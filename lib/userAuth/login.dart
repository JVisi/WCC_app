import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:wccapp/Web/login.dart';
import 'package:wccapp/config/core.dart';
import 'package:wccapp/config/loader.dart';
import 'package:email_validator/email_validator.dart';
import 'package:wccapp/config/model.dart';
import 'package:wccapp/models/user.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginState createState() => LoginState();

}


class LoginState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
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
              padding: EdgeInsets.only(top:SizeConfig.blockSizeVertical*10),
              child: ListView(
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
                              hintText: "E-mail",
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
                              hintText: "Password",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 10)),
                          controller: this.password,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () => changeLoginSave(!keepLoginData),
                          child: Text("Save login data",
                              style: themeConfig().textTheme.bodyText1)),
                      Checkbox(
                          value: keepLoginData,
                          onChanged: (bool _val) => changeLoginSave(_val)),
                    ],
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, "/registerPage"),
                      child: Text("Don't have an account? Sign up here",
                          style: themeConfig().textTheme.bodyText1),
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
                          flex: 2,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: Colors.black)),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Login",
                                style: themeConfig().textTheme.bodyText1,
                              ),
                            ),
                            onPressed: () async {
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingHandler<String>(future: bela, succeeding: (String data) {print(data);return Scaffold(body: Text(data));},)));
                              if (checkEmail() && checkPassword()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LoadingHandler<User>(
                                              future: RequestLogin(
                                                      email: this.email.text,
                                                      password:
                                                          this.password.text,
                                                      keepLogin:keepLoginData)
                                                  .send,
                                              succeeding: (User data) {
                                                AppModel.of(context).setUser(data);
                                                ///save user to scope and go on
                                                return Scaffold(
                                                  body: Text(AppModel.of(context).getUser().email),
                                                );
                                              },
                                            )));
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

  void changeLoginSave(bool val) {
    setState(() {
      keepLoginData = val;
    });
  }
  bool checkEmail() {
    return EmailValidator.validate(this.email.text);
  }
  bool checkPassword() {
    return this.password.text.length > 2;
  }
}
