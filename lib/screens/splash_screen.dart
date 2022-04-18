import 'package:flutter/material.dart';
import 'package:flutter_project/manager/guest_manager.dart';
import 'package:flutter_project/screens/login_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<GuestManager>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: const [
                  Text(
                    'Internship.id',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              const Image(
                image: AssetImage('assets/splashscreen.jpg'),
                height: 250,
              ),
              const SizedBox(height: 15),
              const Text(
                'Find Your internship that you love in here!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              const Text(
                'With Internship.id you can find many Internship, and get experience from it.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              SizedBox(
                height: 40,
                width: 130,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 500),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return LoginScreen(
                            onCreate: (guest) {
                              manager.addGuest(guest);
                            },
                          );
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          final tween2 = Tween(begin: 0.0, end: 1.0);
                          return FadeTransition(
                            opacity: animation.drive(tween2),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    primary: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 9, 28, 44),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Skip Tutorial',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
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
