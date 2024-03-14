import 'package:flutter/material.dart';


class userinfoProvider extends ChangeNotifier{

  String _userinfostatus ='';
  String get UserStatus => _userinfostatus;

  void setUserStatus(String status) {

    _userinfostatus= status;
    notifyListeners();
  }


}