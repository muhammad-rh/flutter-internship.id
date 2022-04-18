import 'package:flutter/material.dart';
import 'package:flutter_project/manager/guest_manager.dart';
import 'package:flutter_project/models/guest.dart';
import 'package:provider/provider.dart';

class ProfileEditScreen extends StatefulWidget {
  final Function(Guest) onCreate;
  const ProfileEditScreen({
    Key? key,
    required this.onCreate,
  }) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final fullnameController = TextEditingController();
  final phoneController = TextEditingController();
  final bioController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<GuestManager>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: const Color.fromARGB(255, 9, 28, 44),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color.fromARGB(255, 230, 231, 235),
                ),
                child: TextFormField(
                  controller: fullnameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.black,
                    ),
                    hintText: 'Fullname',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  style: const TextStyle(fontSize: 18),
                  validator: (value) {
                    if (value!.isNotEmpty && value.length > 5) {
                      return null;
                    } else if (value.isNotEmpty && value.length < 6) {
                      return 'Mininum 6 character';
                    } else {
                      return 'Fill Fullname field please';
                    }
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color.fromARGB(255, 230, 231, 235),
                ),
                child: TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.key,
                      size: 28,
                      color: Colors.black,
                    ),
                    hintText: 'Phone',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  style: const TextStyle(fontSize: 18),
                  validator: (value) {
                    if (value!.isNotEmpty && value.length > 5) {
                      return null;
                    } else if (value.isNotEmpty && value.length < 6) {
                      return 'Mininum 6 character';
                    } else {
                      return 'Fill Phone field please';
                    }
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color.fromARGB(255, 230, 231, 235),
                ),
                child: TextFormField(
                  maxLines: 8,
                  controller: bioController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.description_outlined,
                      size: 28,
                      color: Colors.black,
                    ),
                    hintText: 'Bio',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      var guest = Guest(
                        username: manager.guest[0].username,
                        password: manager.guest[0].password,
                        fullname: fullnameController.text,
                        phone: phoneController.text,
                        bio: bioController.text,
                        checkFile: manager.guest[0].checkFile,
                        pathImage: manager.guest[0].pathImage,
                      );
                      widget.onCreate(guest);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Edit Profile Success'),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Edit',
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
            ],
          ),
        ),
      ),
    );
  }
}
