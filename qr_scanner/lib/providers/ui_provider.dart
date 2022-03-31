import 'package:flutter/cupertino.dart';

class UIProvider extends ChangeNotifier {
  int _selectedMenuOption = 0;

  int get selectedMenuOption {
    return _selectedMenuOption;
  }

  set selectedMenuOption(int option) {
    _selectedMenuOption = option;
    notifyListeners();
  }
}
