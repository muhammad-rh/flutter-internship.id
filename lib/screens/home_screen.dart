import 'package:flutter/material.dart';
import 'package:flutter_project/components/company_card.dart';
import 'package:flutter_project/list/active_list.dart';
import 'package:flutter_project/list/popular_list.dart';
import 'package:flutter_project/manager/activity_manager.dart';
import 'package:flutter_project/models/category.dart';
import 'package:flutter_project/components/category_card.dart';
import 'package:flutter_project/models/company.dart';
import 'package:flutter_project/screens/categories_screen.dart';
import 'package:flutter_project/screens/detail_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<ActivityManager>(context, listen: false);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 9, 28, 44),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Find your\ndream internship here!',
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 249, 253),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.notifications_rounded,
                      color: Color.fromARGB(255, 248, 249, 253),
                      size: 24,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 23, 47, 69),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: 'Search any jobs...',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 248, 249, 253),
                      ),
                      suffixIcon: Icon(
                        Icons.display_settings_rounded,
                        color: Color.fromARGB(255, 248, 249, 253),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 230, 231, 235),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 90,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final Category item = categoryList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 500),
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return CategoriesScreen(
                                itemCat: item.catList,
                                titlePage: item.desc,
                              );
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              final tween2 = Tween(begin: 0.0, end: 1.0);
                              return FadeTransition(
                                opacity: animation.drive(tween2),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: CategoryCard(
                        item: item,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 4);
                  },
                  itemCount: categoryList.length,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Actively Recruting',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 210,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    final Company item = activeList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 500),
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return DetailScreen(
                                companyItem: item,
                                onCreate: (company, date) {
                                  manager.addActivity(company, date);
                                },
                              );
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              final tween2 = Tween(begin: 0.0, end: 1.0);
                              return FadeTransition(
                                opacity: animation.drive(tween2),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: CompanyCard(
                        companyItem: item,
                      ),
                    );
                  }),
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 4);
                  },
                  itemCount: activeList.length,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Popular Jobs',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 210,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    final Company item = popularList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 500),
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return DetailScreen(
                                companyItem: item,
                                onCreate: (company, date) {
                                  manager.addActivity(company, date);
                                },
                              );
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              final tween2 = Tween(begin: 0.0, end: 1.0);
                              return FadeTransition(
                                opacity: animation.drive(tween2),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: CompanyCard(
                        key: Key(item.id),
                        companyItem: item,
                      ),
                    );
                  }),
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 4);
                  },
                  itemCount: popularList.length,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
