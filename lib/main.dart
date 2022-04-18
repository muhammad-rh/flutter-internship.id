import 'package:flutter/material.dart';
import 'package:flutter_project/manager/activity_manager.dart';
import 'package:flutter_project/manager/guest_manager.dart';
import 'package:flutter_project/manager/network_manager.dart';
import 'package:flutter_project/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NetworkManager()),
        ChangeNotifierProvider(create: (context) => ActivityManager()),
        ChangeNotifierProvider(create: (context) => GuestManager())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Project',
        home: SplashScreen(),
      ),
    );
  }
}
