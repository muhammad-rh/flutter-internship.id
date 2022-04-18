import 'package:flutter/cupertino.dart';
import 'package:flutter_project/models/guest.dart';

class GuestManager extends ChangeNotifier {
  final _guest = <Guest>[];
  List<Guest> get guest => List.unmodifiable(_guest);

  void addGuest(Guest guest) {
    _guest.add(guest);
    notifyListeners();
  }

  void updateGuest(input) {
    _guest[0] = input;
    notifyListeners();
  }
}
