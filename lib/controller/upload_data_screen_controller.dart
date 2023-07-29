import 'package:flutter/material.dart';

class UploadDataScreenController extends ChangeNotifier {
  bool showDataChart = true;

  changeDataChartVlaue(bool value) {
    showDataChart = value;
    notifyListeners();
  }
}
