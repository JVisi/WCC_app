import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:wccapp/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModel extends Model{
  User _user;
  void setUser(User currentUser)=>this._user=currentUser;
  User getUser()=>this._user;



  Future<Map<String, String>> loadLogin() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return {"email":prefs.getString("email"),"password":prefs.getString("password")};
  }

  static AppModel of(BuildContext context) => ScopedModel.of<AppModel>(context);
}