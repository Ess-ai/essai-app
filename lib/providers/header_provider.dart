import 'package:essai/models/user.dart';
import 'package:essai/services/services.dart';
import 'package:flutter/foundation.dart';

final service = Services();

class HeaderProvider extends ChangeNotifier {
  UserModel _user = UserModel(id: '', userName: '');
  final List _menuItems = ['DashBoard', 'Essays', 'Tools'];
  final List _dropdownItems = [
    'user',
    'Profile',
    'Settings',
    'Log Out',
  ];

  //GetUser
  void getUser() async {
    final usr = await service.getusr.getUser();
    _user = usr;
    _dropdownItems[0] = _user.userName;

    notifyListeners();
  }

  get user => _user;
  get menuItems => _menuItems;
  get dropdownItems => _dropdownItems;
}
