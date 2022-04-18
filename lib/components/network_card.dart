import 'package:flutter/material.dart';
import 'package:flutter_project/models/network.dart';

class NetworkCard extends StatelessWidget {
  final Network networkList;
  final Function() onPressed;
  const NetworkCard({
    Key? key,
    required this.networkList,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Text(
                        networkList.name[0].toUpperCase(),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      radius: 22,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          networkList.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          networkList.phone,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: const Text('Are you sure delete this?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: onPressed,
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Color.fromARGB(255, 23, 47, 69),
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
