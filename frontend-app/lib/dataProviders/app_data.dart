import 'package:flutter/foundation.dart';
import 'package:mediserv/model/user_model.dart';

class AppData extends ChangeNotifier {
  bool loggedIn = false;
  UserModel? userModel;
  void login_out(bool login) {
    loggedIn = login;
    notifyListeners();
  }

  void setUser(UserModel u) {
    userModel = u;
    notifyListeners();
  }
}
