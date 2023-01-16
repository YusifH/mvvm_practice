import 'dart:io';

import 'package:base_practice/user_list/repo/api_status.dart';
import 'package:http/http.dart' as http;

import '../utils/constant.dart';
import '../models/user_list_model.dart';
class UserServices{

  static Future<Object> getUser() async{

    try{
      var url = Uri.parse(userList);
      var response = await http.get(url);
      if(response.statusCode == 200){
        return Success(response: userListModelFromJson(response.body), code: 200);
      }
      return Failure(code: USER_INVALID_RESPONSE, errorResponse: '100');
    } on HttpException{
      return Failure(code: NO_INTERNET, errorResponse: 101);
    } on FormatException{
      return Failure(code: INVALID_FORMAT, errorResponse: 102);
    }

    catch(e){
      return Failure(code: UNKOWN_ERROR, errorResponse: 103);
    }
  }
}