import 'package:flutter/material.dart';
import 'package:flutter_project/list/coding_list.dart';
import 'package:flutter_project/list/design_list.dart';
import 'package:flutter_project/list/marketing_list.dart';
import 'package:flutter_project/list/network_list.dart';
import 'package:flutter_project/models/company.dart';

class Category {
  final String desc;
  final IconData icon;
  final Color color;
  final List<Company> catList;

  Category({
    required this.desc,
    required this.icon,
    required this.color,
    required this.catList,
  });
}

var categoryList = [
  Category(
    desc: 'Design',
    icon: Icons.palette,
    color: const Color.fromARGB(255, 191, 150, 61),
    catList: designList,
  ),
  Category(
    desc: 'Coding',
    icon: Icons.code,
    color: const Color.fromARGB(255, 150, 30, 30),
    catList: codingList,
  ),
  Category(
    desc: 'Network',
    icon: Icons.wifi,
    color: const Color.fromARGB(255, 38, 30, 150),
    catList: networkList,
  ),
  Category(
    desc: 'Marketing',
    icon: Icons.monetization_on,
    color: const Color.fromARGB(255, 40, 131, 38),
    catList: marketingList,
  ),
];
