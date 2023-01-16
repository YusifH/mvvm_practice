import 'package:base_practice/user_list/repo/api_status.dart';
import 'package:base_practice/user_list/repo/user_service.dart';
import 'package:flutter/material.dart';

import '../models/user_error.dart';
import '../models/user_list_model.dart';

class UsersViewModel extends ChangeNotifier{
  bool _loading = false;
  List<UserModel> _userListModel = [];
  late UserError _userError;
  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError get userError => _userError;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }
  setUserListModel(List<UserModel> userListModel){
    _userListModel = userListModel;
  }

  setUserError(UserError userError){
    _userError = userError;
  }
  getUsers() async{
    setLoading(true);
    var response = await UserServices.getUser();
    if(response is Success){
      setUserListModel(response.response as List<UserModel>);
    }
    if(response is Failure){
      UserError userError = UserError(message: response.errorResponse.toString(), code: response.code);
      setUserError(userError);
    }
    setLoading(false);
  }
}