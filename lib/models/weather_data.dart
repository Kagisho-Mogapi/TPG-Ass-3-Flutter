import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class WeatherData with ChangeNotifier {
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMsg = '';

  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errorMsg => _errorMsg;

  Future<void> get fetchData async {
    final extractedData = await get(Uri.parse(
        'https://dl.dropbox.com/s/u1gb9ovxvtaugqj/weathere.json?dl=0'));

    if (extractedData.statusCode == 200) {
      try {
        _map = jsonDecode(extractedData.body);
        _error = false;
      } catch (e) {
        _map = {};
        _error = true;
        _errorMsg = e.toString();
      }
    } else {
      _map = {};
      _error = true;
      _errorMsg = 'Error: Failed to get data!!';
    }
    notifyListeners();
  }
}
