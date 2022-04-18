import 'package:flutter/material.dart';
import 'package:flutter_project/components/network_card.dart';
import 'package:flutter_project/manager/network_manager.dart';

class NetworkListScreen extends StatelessWidget {
  final NetworkManager manager;
  const NetworkListScreen({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final networkItem = manager.network;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 0),
        itemBuilder: (context, index) {
          final item = networkItem[index];
          return NetworkCard(
            networkList: item,
            onPressed: () {
              manager.deleteNetwork(index);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${item.name} Delete'),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 8,
          );
        },
        itemCount: networkItem.length,
      ),
    );
  }
}
