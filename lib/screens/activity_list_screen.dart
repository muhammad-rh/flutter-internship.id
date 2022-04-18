import 'package:flutter/material.dart';
import 'package:flutter_project/manager/activity_manager.dart';
import 'package:flutter_project/screens/detail_activity_screen.dart';

class ActivityListScreen extends StatelessWidget {
  final ActivityManager manager;
  const ActivityListScreen({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activityItem = manager.company;
    final date = manager.date;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 0),
        itemBuilder: (context, index) {
          final item = activityItem[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  reverseTransitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return DetailActivityScreen(
                      companyItem: item,
                    );
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    final tween2 = Tween(begin: 0.0, end: 1.0);
                    return FadeTransition(
                      opacity: animation.drive(tween2),
                      child: child,
                    );
                  },
                ),
              );
            },
            onLongPress: () {
              manager.deleteActivity(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text('${item.position} - ${item.companyName} Delete'),
                ),
              );
            },
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  item.logo,
                  fit: BoxFit.cover,
                ),
                title: Text(item.position),
                subtitle: Text(item.companyName),
                trailing: Text(
                  item.location + '\n' + date,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 2);
        },
        itemCount: activityItem.length,
      ),
    );
  }
}
