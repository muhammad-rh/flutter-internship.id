import 'package:file_picker/file_picker.dart';

class Guest {
  final String username;
  final String password;
  final String fullname;
  final String phone;
  final String bio;
  PlatformFile? file;
  bool? checkFile;
  String? pathImage;

  Guest({
    required this.username,
    required this.password,
    required this.fullname,
    required this.phone,
    required this.bio,
    this.file,
    this.checkFile,
    this.pathImage,
  });
}
