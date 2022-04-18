import 'package:flutter/cupertino.dart';
import 'package:flutter_project/models/company.dart' as company_model;

class ActivityManager extends ChangeNotifier {
  final _company = <company_model.Company>[];
  List<company_model.Company> get company => List.unmodifiable(_company);

  String _date = '';
  String get date => _date;

  void deleteActivity(int index) {
    _company.removeAt(index);
    notifyListeners();
  }

  void addActivity(company_model.Company company, String date) {
    _company.add(company);
    _date = date;
    notifyListeners();
  }
}
