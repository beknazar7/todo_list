import 'package:flutter/material.dart';
import 'add_state.dart';

class AddViewModel extends ChangeNotifier {
  AddState state = AddState(isInitial: true, isSucceed: false);

  void addTask(String text) {
    if (text.isEmpty) {
      state = AddState(isInitial: false, isSucceed: false);
    } else {
      state = AddState(isInitial: false, isSucceed: true);
    }
    notifyListeners();
  }
}