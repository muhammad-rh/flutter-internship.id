import 'package:flutter/material.dart';
import 'package:flutter_project/manager/activity_manager.dart';
import 'package:flutter_project/models/company.dart';
import 'package:flutter_project/screens/detail_screen.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  final List<Company> itemCat;
  final String titlePage;
  const CategoriesScreen({
    Key? key,
    required this.itemCat,
    required this.titlePage,
  }) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool isBookmark = false;
  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<ActivityManager>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 9, 28, 44),
        title: Text(widget.titlePage),
      ),
      body: Container(
        padding: const EdgeInsets.all(2.0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 231, 235),
        ),
        child: ListView.separated(
          itemBuilder: (context, index) {
            final Company item = widget.itemCat[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    reverseTransitionDuration:
                        const Duration(milliseconds: 500),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return DetailScreen(
                        companyItem: item,
                        onCreate: (company, date) {
                          manager.addActivity(company, date);
                        },
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
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Card(
                  child: ListTile(
                    leading: Image.asset(
                      item.logo,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item.position),
                    subtitle: Text(item.companyName),
                    trailing: Text(item.location),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 0);
          },
          itemCount: widget.itemCat.length,
        ),
      ),
    );
  }
}
