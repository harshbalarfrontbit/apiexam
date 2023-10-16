import 'package:apitaskexam/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  time() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("accessToken");

    Future.delayed(
      const Duration(seconds: 3),
          () {
        if (token != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
                  (route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
                  (route) => false);
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    time();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                height: 150,
                width: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Image(
                  image: NetworkImage('https://thumbs.dreamstime.com/b/lets-shopping-logo-design-template-cart-icon-designs-134743663.jpg'),
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
