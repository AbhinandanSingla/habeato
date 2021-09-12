import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  selectedProduct(int index, int selectedIndex) {
    selectedIndex = index;
    notifyListeners();
    return selectedIndex;
  }

  selectSalad(bool select) {
    select = !select;
    notifyListeners();
    return select;
  }
}
