import 'package:flutter/material.dart';
import 'package:flutter_project/models/company.dart';

class CompanyCard extends StatefulWidget {
  final Company companyItem;
  const CompanyCard({
    Key? key,
    required this.companyItem,
  }) : super(key: key);

  @override
  State<CompanyCard> createState() => _CompanyCardState();
}

class _CompanyCardState extends State<CompanyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(
                widget.companyItem.logo,
                fit: BoxFit.cover,
              ),
              title: Text(widget.companyItem.position),
              subtitle: Text(widget.companyItem.companyName),
            ),
            Row(
              children: [
                const SizedBox(width: 8),
                const Icon(
                  Icons.location_on,
                  size: 30,
                  color: Color.fromARGB(255, 23, 47, 69),
                ),
                const SizedBox(width: 4),
                Text(widget.companyItem.location),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.companyItem.deadline + ' left'),
                  Text(widget.companyItem.posted),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: 30,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final String item = widget.companyItem.tags[index];
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 62, 118, 169),
                    ),
                    onPressed: () {},
                    child: Text(item),
                  );
                },
                itemCount: widget.companyItem.tags.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 8);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
