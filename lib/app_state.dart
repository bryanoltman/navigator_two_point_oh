import 'package:flutter/material.dart';
import 'package:navigator_two_point_oh/home_screen.dart';
import 'package:navigator_two_point_oh/models/models.dart';

class AppState with ChangeNotifier {
  bool _isHome = false;
  bool get isHome => _isHome;
  set isHome(bool newValue) {
    _isHome = newValue;
    notifyListeners();
  }

  HomeScreenTab _currentTab;
  HomeScreenTab get currentTab => _currentTab;
  set currentTab(HomeScreenTab newTab) {
    _currentTab = newTab;
    notifyListeners();
  }

  Lion? _selectedLion;
  Lion? get selectedLion => _selectedLion;
  set selectedLion(Lion? newLion) {
    _selectedLion = newLion;
    notifyListeners();
  }

  Tiger? _selectedTiger;
  Tiger? get selectedTiger => _selectedTiger;
  set selectedTiger(Tiger? newTiger) {
    _selectedTiger = newTiger;
    notifyListeners();
  }

  Bear? _selectedBear;
  Bear? get selectedBear => _selectedBear;
  set selectedBear(Bear? newBear) {
    _selectedBear = newBear;
    notifyListeners();
  }

  AppState({required HomeScreenTab currentTab}) : _currentTab = currentTab;
}
