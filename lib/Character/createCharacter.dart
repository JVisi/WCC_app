import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:wccapp/Web/getCharacter.dart';
import 'package:wccapp/Web/setCharacter.dart';
import 'package:wccapp/config/core.dart';
import 'package:wccapp/config/lang/locals.dart';
import 'package:wccapp/config/loader.dart';
import 'package:wccapp/config/model.dart';
import 'package:wccapp/models/character.dart';

class CreateCharacter extends StatefulWidget {
  @override
  CreateCharacterState createState() => CreateCharacterState();
}

class CreateCharacterState extends State<CreateCharacter> {
  final name = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.addListener(checkName);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/Images/background/Megumin.jpg"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 1.0),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 10),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.7)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(
                                    SizeConfig.blockSizeVertical * 2.0),
                                child: Text(
                                  AppLocalizations.of(context)
                                      .createCharacterTitle,
                                  style: themeConfig().textTheme.bodyText2,
                                ),
                              ),
                            )),
                        Spacer(flex: 1)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 4),
                        child: ListView(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 0),
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
                                        hintText: AppLocalizations.of(context)
                                            .createCharacter,
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(left: 10)),
                                    controller: this.name,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 5),
                              child: Row(
                                children: <Widget>[
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          side:
                                              BorderSide(color: Colors.black)),
                                      child: Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .createCharacterBtn,
                                          style:
                                              themeConfig().textTheme.bodyText1,
                                        ),
                                      ),
                                      onPressed: () async {
                                        //Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingHandler<String>(future: bela, succeeding: (String data) {print(data);return Scaffold(body: Text(data));},)));
                                        if (checkName()) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      setCharacter(
                                                        context,
                                                        this.name.text,
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
                            Padding(
                              padding: EdgeInsets.only(
                                  top: SizeConfig.blockSizeVertical * 5.0),
                              child: FloatingActionButton(
                                backgroundColor: themeConfig().buttonColor,
                                foregroundColor: Colors.black,
                                onPressed: () {
                                  Navigator.pushNamed(context, "/loginPage");
                                },
                                child: Icon(Icons.arrow_back),
                              ),
                            )
                          ],
                        ),
                      ),
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

  bool checkName() {
    return this.name.text.length > 2;
  }
}

getCharacter(BuildContext context, [Widget onError]) {
  return LoadingHandler<Character>(
    future: GetCharacter(AppModel.of(context).getUser().id).send,
    succeeding: (Character ch) {
      AppModel.of(context).setCharacter(ch);

      ///return the loader for the main game screen
      return Scaffold(
          body: RaisedButton(
        child: Text("bacccckkkk"),
        onPressed: () => Navigator.pop(context),
      ));
    },
    onError: CreateCharacter(),
  );
}

setCharacter(BuildContext context, String name, [Widget onError]) {
  return LoadingHandler<Character>(
    future: SetCharacter(name, AppModel.of(context).getUser().id).send,
    succeeding: (Character ch) {
      AppModel.of(context).setCharacter(ch);

      ///return the loader for main game screen
      return Scaffold(
          body: RaisedButton(
        child: Text("back"),
        onPressed: () => Navigator.pop(context),
      ));
    },
    onError: onError,
  );
}
