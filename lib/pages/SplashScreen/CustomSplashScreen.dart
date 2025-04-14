import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/pages/Auth/SignIn/signin_page.dart';
import 'package:my_app/pages/Dashboard/home_page.dart';
import 'package:my_app/pages/OnboardingScreen/OnboardingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class CustomSplashScreen extends StatefulWidget {
  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  Future<void> _checkUserStatus() async {
  final prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  String? token = prefs.getString('auth_token');

  await Future.delayed(const Duration(seconds: 3));

  if (isFirstTime) {
    // Mark it as no longer the first time for future launches
    await prefs.setBool('isFirstTime', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnboardingScreen()),
    );
  } else if (token != null && token.isNotEmpty) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SigninPage()),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            'assets/icons/bgimage.svg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Image.asset(
              'assets/logo.png',
              width: 180,
              height: 180,
            ),
          ),
        ],
      ),
    );
  }
}
