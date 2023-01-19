import 'package:instagram/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram/resources/auth_methods.dart';

class UserProvider with ChangeNotifier{
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;
  Future<void> refershUser() async{
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}