import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  String _userName = 'Invitado';

  String get userName => _userName;

  set setUserName(String name) {
    _userName = name;
    notifyListeners();
  }
}
