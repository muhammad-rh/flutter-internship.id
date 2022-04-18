import 'package:flutter/material.dart';
import 'package:flutter_project/models/company.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {
  final Function(Company, String) onCreate;
  final Company companyItem;
  const DetailScreen({
    Key? key,
    required this.companyItem,
    required this.onCreate,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
                          height: 235, //height of TabBarView
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
                        SizedBox(
                          height: 45,
                          child: TextButton(
                            onPressed: () {
                              var activity = Company(
                                id: widget.companyItem.id,
                                logo: widget.companyItem.logo,
                                position: widget.companyItem.position,
                                companyName: widget.companyItem.companyName,
                                location: widget.companyItem.location,
                                deadline: widget.companyItem.deadline,
                                posted: widget.companyItem.posted,
                                applicants: widget.companyItem.applicants,
                                salary: widget.companyItem.salary,
                                tags: widget.companyItem.tags,
                                description: widget.companyItem.description,
                                requirement: widget.companyItem.requirement,
                                companyDesc: widget.companyItem.companyDesc,
                              );
                              String date = DateFormat('EEE, MMM d').format(
                                DateTime.now(),
                              );
                              widget.onCreate(activity, date);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Activity ${widget.companyItem.position} - ${widget.companyItem.companyName} Has Added'),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              primary: Colors.white,
                              backgroundColor:
                                  const Color.fromARGB(255, 23, 47, 69),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Apply this job",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
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
