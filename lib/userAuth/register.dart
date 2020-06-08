import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:wccapp/config/core.dart';
import 'package:wccapp/config/loader.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>RegisterState();
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
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white.withOpacity(0.9)),
                    child: AspectRatio(
                      aspectRatio: SizeConfig.blockSizeVertical,
                      child: TextFormField(
                        style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3),
                        decoration: InputDecoration(
                            hintText: "E-mail",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left:10)),
                        controller: this.email,
                      ),
                    ),
                  ),
                ),Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white.withOpacity(0.9)),
                    child: AspectRatio(
                      aspectRatio: SizeConfig.blockSizeVertical,
                      child: TextFormField(
                        style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3),
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left:10)),
                        controller: this.password,
                      ),
                    ),
                  ),
                ),Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white.withOpacity(0.9)),
                    child: AspectRatio(
                      aspectRatio: SizeConfig.blockSizeVertical,
                      child: TextFormField(
                        style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3),
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password again",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left:10)),
                        controller: this.password2,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () => saveLogin(!keepLoginData),
                        child: Text("Save login data",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.5))),
                    Checkbox(
                        value: keepLoginData,
                        onChanged: (bool _val) => saveLogin(_val)),
                  ],
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text("Already have an account? Sign in here",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.5)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:SizeConfig.blockSizeVertical*5),
                  child: Row(
                    children: <Widget>[
                      Spacer(flex: 1,),
                      Expanded(flex: 2,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(color: Colors.black)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Login",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2),),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoadingHandler<String>(
                                      future: bela,
                                      succeeding: (String data) {
                                        print(data);
                                        return Scaffold(body: Text(data));
                                      },
                                    )));
                          },
                        ),
                      ),Spacer(flex: 1,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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

  Future<String> bela() async {
    //new Future.delayed(Duration(seconds: 3));
    final response = await http
        .get("http://192.168.1.66:3000")
        .timeout(Duration(seconds: 3));
    return response.body;
  }
}
