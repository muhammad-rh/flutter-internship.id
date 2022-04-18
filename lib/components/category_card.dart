import 'package:flutter/material.dart';
import 'package:flutter_project/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category item;

  const CategoryCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              item.icon,
              size: 30,
              color: item.color,
            ),
            Text(
              item.desc,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
