import 'package:flutter/material.dart';
import 'package:flutter_project/manager/activity_manager.dart';
import 'package:flutter_project/screens/activity_list_screen.dart';
import 'package:provider/provider.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 9, 28, 44),
          ),
          child: const SafeArea(
            child: Center(
              child: Text(
                'My Activities',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 620,
          child: buildActivityScreen(),
        ),
      ],
    );
  }

  Widget buildActivityScreen() {
    return Consumer<ActivityManager>(
      builder: (context, value, child) {
        if (value.company.isNotEmpty) {
          return ActivityListScreen(manager: value);
        } else {
          return const Center(
            child: Text('You haven\'t any activities yet'),
          );
        }
      },
    );
  }
}
