import 'package:flutter/material.dart';
import 'package:flutter_project/manager/network_manager.dart';
import 'package:flutter_project/screens/network_add_screen.dart';
import 'package:flutter_project/screens/network_list_screen.dart';
import 'package:provider/provider.dart';

class NetworkScreen extends StatefulWidget {
  const NetworkScreen({Key? key}) : super(key: key);

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<NetworkManager>(context, listen: false);
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 9, 28, 44),
            ),
            child: const SafeArea(
              child: TabBar(
                labelColor: Color.fromARGB(255, 248, 249, 253),
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.orange,
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                tabs: [
                  Tab(
                    text: 'My Network',
                  ),
                  Tab(
                    text: 'Add Network',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 605,
            child: TabBarView(
              children: [
                SizedBox(
                  child: buildNetworkScreen(),
                ),
                SizedBox(
                  child: NetworkAddScreen(
                    onCreate: (network) {
                      manager.addNetwork(network);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNetworkScreen() {
    return Consumer<NetworkManager>(
      builder: (context, value, child) {
        if (value.network.isNotEmpty) {
          return NetworkListScreen(manager: value);
        } else {
          return const Center(
            child: Text('You haven\'t network yet'),
          );
        }
      },
    );
  }
}
