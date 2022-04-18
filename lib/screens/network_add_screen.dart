import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/models/network.dart';
import 'package:uuid/uuid.dart';

class NetworkAddScreen extends StatefulWidget {
  final Function(Network) onCreate;
  const NetworkAddScreen({
    Key? key,
    required this.onCreate,
  }) : super(key: key);

  @override
  State<NetworkAddScreen> createState() => _NetworkAddScreenState();
}

class _NetworkAddScreenState extends State<NetworkAddScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              style: const TextStyle(fontSize: 18),
              validator: (value) {
                if (value!.isNotEmpty && value.length > 5) {
                  return null;
                } else if (value.isNotEmpty && value.length < 6) {
                  return 'Mininum 6 character';
                } else {
                  return 'Fill name field please';
                }
              },
            ),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
              style: const TextStyle(fontSize: 18),
              validator: (value) {
                if (value!.isNotEmpty && value.length > 5) {
                  return null;
                } else if (value.isNotEmpty && value.length < 6) {
                  return 'Mininum 6 character';
                } else {
                  return 'Fill phone field please';
                }
              },
            ),
            const SizedBox(
              height: 36,
            ),
            SizedBox(
              child: ElevatedButton(
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    var network = Network(
                      id: const Uuid().v1(),
                      name: nameController.text,
                      phone: phoneController.text,
                    );
                    widget.onCreate(network);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Network Added'),
                      ),
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Save Network'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
