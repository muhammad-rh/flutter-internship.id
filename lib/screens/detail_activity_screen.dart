import 'package:flutter/material.dart';
import 'package:flutter_project/models/company.dart';

class DetailActivityScreen extends StatefulWidget {
  final Company companyItem;
  const DetailActivityScreen({
    Key? key,
    required this.companyItem,
  }) : super(key: key);

  @override
  State<DetailActivityScreen> createState() => _DetailActivityScreenState();
}

class _DetailActivityScreenState extends State<DetailActivityScreen> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 9, 28, 44),
        title: const Text('Job Details'),
        actions: const [
          Icon(Icons.notifications),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Image.asset(
                  widget.companyItem.logo,
                  fit: BoxFit.cover,
                ),
                title: Text(widget.companyItem.position),
                subtitle: Text(widget.companyItem.companyName),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 30,
                    color: Color.fromARGB(255, 23, 47, 69),
                  ),
                  const SizedBox(width: 4),
                  Text('Located in ' + widget.companyItem.location),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Deadline:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(widget.companyItem.deadline),
                          const SizedBox(height: 8),
                          const Text(
                            'Applicant:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(widget.companyItem.applicants),
                          const SizedBox(height: 8),
                          const Text(
                            'Salary:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(widget.companyItem.salary),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Tags',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: widget.companyItem.tags.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: MediaQuery.of(context)
                                      .size
                                      .height /
                                  (MediaQuery.of(context).size.width / 1.25),
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                            ),
                            itemBuilder: (context, index) {
                              final String item =
                                  widget.companyItem.tags[index];
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(255, 62, 118, 169),
                                ),
                                onPressed: () {},
                                child: Text(
                                  item,
                                  textAlign: TextAlign.center,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.orange,
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        tabs: [
                          Tab(
                            text: 'Descriptions',
                          ),
                          Tab(
                            text: 'Company',
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 280,
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.grey, width: 0.5),
                            ),
                          ),
                          child: TabBarView(
                            children: <Widget>[
                              SingleChildScrollView(
                                child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 16),
                                      const Text(
                                        'Job Description',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        widget.companyItem.description,
                                        textAlign: TextAlign.justify,
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'Requirement',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      SizedBox(
                                        height: 100,
                                        child: ListView.separated(
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final String item = widget
                                                .companyItem.requirement[index];
                                            return Text(
                                              '-  ' + item,
                                              textAlign: TextAlign.justify,
                                            );
                                          },
                                          itemCount: widget
                                              .companyItem.requirement.length,
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(height: 8);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Center(
                                  child: Text(
                                    widget.companyItem.companyDesc,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
