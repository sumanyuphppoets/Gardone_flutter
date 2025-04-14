import 'package:flutter/material.dart';
import 'package:my_app/pages/Auth/SignIn/signin_page.dart';
import 'package:my_app/pages/Auth/Signup/signup_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B5D47),
      body: Stack(
        children: [
          PageView(
            controller: _controller,

            onPageChanged: (index) {
              setState(() {
                currentPage = index;
                onLastPage = index == 2;
              });
            },
            children: [
              buildPage(
                image: 'assets/Onboarding_Image/Onboarding_Screen1.png',
                text: 'Discover, grow, and thrive with ease.',
              ),
              buildPage(
                image: 'assets/Onboarding_Image/Onboarding_Screen2.png',
                text: 'Trust us to bring your greenery safely and swiftly.',
              ),
              buildPage(
                image: 'assets/Onboarding_Image/Onboarding_Screen3.png',
                text: 'Seamless plant delivery at your doorstep.',
                isFinal: true,
              ),
            ],
          ),

          // Bottom controls
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Show "Back" only on page 1
                (currentPage == 1)
                    ? GestureDetector(
                      onTap: () {
                        _controller.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                    : SizedBox(width: 50),

                // Page indicator
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(
                    dotColor: Colors.white38,
                    activeDotColor: Colors.white,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),

                // Show "Skip" only on page 0 and 1
                (!onLastPage)
                    ? GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                    : SizedBox(width: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage({
    required String image,
    required String text,
    bool isFinal = false,
  }) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(image, fit: BoxFit.cover),
        Container(
          color: Colors.black.withOpacity(0.3), // optional overlay
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 95),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top Text
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              if (isFinal)
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xFF0B5D47),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SigninPage()),
                        );
                      },
                      child: Text("Get Started"),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SigninPage()),
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.white70),
                          children: [
                            TextSpan(
                              text: "Log in",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
