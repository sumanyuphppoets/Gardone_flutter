import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/pages/Auth/SignIn/signin_page.dart';
import 'package:my_app/pages/MyProfile/my_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ), // Added left and right padding
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/Profile.jpg',
            ), // Add profile image
            radius: 22,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  const Text(
                    "Sumanyu Singh ",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyProfilePage(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/wave.png',
                      width: 18,
                      height: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Spacer(),
          GestureDetector(
            onTap: () async {
              // Sign out from Firebase
              await FirebaseAuth.instance.signOut();

              // Clear saved login data
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove('auth_token');
              await prefs.setBool('isLoggedIn', false);

              // Navigate to sign-in page
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SigninPage()),
                (route) => false,
              );
            },
            child: Stack(
              children: [
                const Icon(Icons.notifications, size: 30, color: Colors.black),
                Positioned(
                  right: 2,
                  top: 2,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
