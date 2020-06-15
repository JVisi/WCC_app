import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:wccapp/models/user.dart';

class AppModel extends Model{
  User _user;
  void setUser(User currentUser)=>this._user=currentUser;
  User getUser()=>this._user;

  static AppModel of(BuildContext context) => ScopedModel.of<AppModel>(context);
}