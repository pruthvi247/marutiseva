import 'package:flutter/material.dart';

class IndexIncrement {
  ValueNotifier<int> tabIndex = ValueNotifier<int>(0);
  IndexIncrement({required tabIndex});
}

class IndexIncrementNotifier extends ValueNotifier<IndexIncrement> {
  IndexIncrementNotifier({required IndexIncrement value}) : super(value);
  void setTabIndex(int num) {
    value.tabIndex.value = num;
    notifyListeners();
  }
}
