import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/manager/guest_manager.dart';
import 'package:flutter_project/screens/profile_edit_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final GuestManager manager;
  const ProfileScreen({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final guestItem = widget.manager.guest;
    final manager = Provider.of<GuestManager>(context, listen: false);

    void _pickFile() async {
      final result = await FilePicker.platform.pickFiles();
      if (result == null) return;

      guestItem[0].file = result.files.first;
      setState(() {
        guestItem[0].checkFile = true;
        // print('check = ' + guestItem[0].checkFile.toString());
        guestItem[0].pathImage = ((guestItem[0].file)!.path).toString();
        // print('path =  ' + guestItem[0].pathImage.toString());
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 9, 28, 44),
          ),
          child: SafeArea(
            child: Container(
              height: 662,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 230, 231, 235),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 120,
                    child: Center(
                      child: GestureDetector(
                        onLongPress: () {
                          _pickFile();
                        },
                        child: !guestItem[0].checkFile!
                            ? const CircleAvatar(
                                child: Icon(
                                  Icons.person,
                                  size: 60,
                                ),
                                radius: 60,
                              )
                            : ClipOval(
                                child: Image.file(
                                  File(guestItem[0].pathImage!),
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                        // child: CircleAvatar(
                        //   child: !guestItem[0].checkFile!
                        //       ? const Icon(Icons.person, size: 60)
                        //       : Image.file(
                        //           File(guestItem[0].pathImage!),
                        //         ),
                        //   radius: 60,
                        // ),
                      ),
                    ),
                  ),
                  const Text('Username'),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 28, 44),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      guestItem[0].username,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Text('Fullname'),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 28, 44),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      guestItem[0].fullname,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Text('Phone'),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 28, 44),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      guestItem[0].phone,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Text('Bio'),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 28, 44),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      guestItem[0].bio,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 500),
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return ProfileEditScreen(
                                onCreate: (guest) {
                                  manager.updateGuest(guest);
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
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 23, 47, 69),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Version 1.0.0',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
