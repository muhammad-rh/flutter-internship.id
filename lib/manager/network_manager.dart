import 'package:flutter/cupertino.dart';
import 'package:flutter_project/models/network.dart';

class NetworkManager extends ChangeNotifier {
  final _network = <Network>[];
  List<Network> get network => List.unmodifiable(_network);

  void deleteNetwork(int index) {
    _network.removeAt(index);
    notifyListeners();
  }

  void addNetwork(Network network) {
    _network.add(network);
    notifyListeners();
  }
}
