import 'package:flutter/material.dart';
import 'package:my_app/Components/Cardslider/cardslider.dart';
import 'package:my_app/Components/CategoriesSlider/CategoriesSlider.dart';
import 'package:my_app/Components/ProfileHeader/profile_header.dart';
import 'package:my_app/Components/Bannerslider/slider.dart';
import 'package:my_app/Components/BottomTabs/bottomtabs.dart'; // Import bottom tabs
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg for SvgPicture
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app/pages/Cart/cart.dart';
import 'package:my_app/pages/Maintenance/Maintenance.dart';
import 'package:my_app/pages/Wishlist/wishlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreenContent(),
    const WishlistPage(),
    const CartPage(),
    const MaintenancePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomTabs(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> newArrivals = [
      {
        "image": "assets/images/Houseplant.png",
        "backgroundImage": "assets/images/Horizontalbg1.png",
        "name": "Monstera",
        "category": "Outdoor",
        "duration": "6 Months",
        "price": "40.25",
      },
      {
        "image": "assets/images/Houseplant.png",
        "backgroundImage": "assets/images/Horizontalbg2.png",
        "name": "Aloe Vera",
        "category": "Indoor",
        "duration": "1 Year",
        "price": "30.50",
      },
    ];

    final List<Map<String, dynamic>> bestSellers = [
      {
        "image": "assets/images/Houseplant.png",
        "backgroundImage": "assets/images/Horizontalbg1.png",
        "name": "Snake Plant",
        "category": "Indoor",
        "duration": "8 Months",
        "price": "50.00",
      },
      {
        "image": "assets/images/Houseplant.png",
        "backgroundImage": "assets/images/Horizontalbg2.png",
        "name": "Cactus",
        "category": "Desert",
        "duration": "2 Years",
        "price": "25.75",
      },
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            ProfileHeader(),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.mic),
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
            
            SliderWidget(), // Add the slider widget here
            CategoriesSlider(),
            SizedBox(height: 20),
            CardSlider(title: "New Arrivals", items: newArrivals),
            SizedBox(height: 20),
            CardSlider(title: "Best Sellers", items: bestSellers),
            SizedBox(height: 20),
            _buildBanner(),
            SizedBox(height: 20),
            _buildWhyChooseUs(context),
            SizedBox(height: 20),
            _buildTestimonials(),
          ],
        ),
      ),
    );
  }
}

Widget _buildBanner() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10), // Adds padding on left & right
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("assets/images/HealthyImage.png"),
          fit: BoxFit.cover,
        ),
      ),
      height: 200,
      child: Stack(
        children: [
          Positioned(
            left: 16,
            top: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 260,
                  child: Text(
                    "Healthy plants thrive with our expert care and attention.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Know More",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildWhyChooseUs(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start, 
    children: [
      Padding(
        padding: EdgeInsets.only(left: 5), // Adds left padding only to the text
        child: Text(
          "Why Choose Us?",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'AvenirNextCyr',
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      SizedBox(height: 10),
      Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          _buildFeatureCard(
            "Secure & Recyclable Packaging",
            "assets/icons/Secure&Recyclable_Packaging.svg",
            context,
          ),
          _buildFeatureCard(
            "Free Replacement If Damage",
            "assets/icons/FreeReplacement.svg",
            context,
          ),
          _buildFeatureCard(
            "Chemical Free Plants",
            "assets/icons/Chemical_Free_Plants.svg",
            context,
          ),
          _buildFeatureCard(
            "Self-Watering Pots With Every Plant",
            "assets/icons/Self-Watering-Pots.svg",
            context,
          ),
        ],
      ),
    ],
  );
}

Widget _buildFeatureCard(String text, String svgPath, BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double cardWidth = (screenWidth / 2) - 10; // Adjust for spacing
  return Container(
    width: cardWidth,
    margin: EdgeInsets.only(left: 2),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: SvgPicture.asset(svgPath, width: 50, height: 50),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

Widget _buildTestimonials() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 10), // Adds left padding
        child: Text(
          "Testimonials",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'AvenirNextCyr',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      SizedBox(height: 10),
      _buildTestimonialSlider(),
    ],
  );
}

Widget _buildTestimonialSlider() {
  List<Map<String, String>> testimonials = [
    {
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tellus auctor posuere.",
      "author": "- Jaivardhan Singh"
    },
    {
      "text": "Fantastic service and great products! I highly recommend them.",
      "author": "- Sarah Johnson"
    },
    {
      "text": "Their quality is unmatched, and I love their customer support!",
      "author": "- Rahul Verma"
    },
  ];

  return Padding(
  padding: EdgeInsets.only(left: 20), // Pushes the slider slightly right
  child: CarouselSlider(
    options: CarouselOptions(
      height: 150,
      autoPlay: true,
      enlargeCenterPage: false,
      viewportFraction: 0.90, // Slightly reduce width so right side is fully visible
      aspectRatio: 16 / 9,
      autoPlayInterval: Duration(seconds: 4),
      autoPlayCurve: Curves.fastOutSlowIn,
    ),
    items: testimonials.map((testimonial) {
      return _buildTestimonialCard(testimonial["text"]!, testimonial["author"]!);
    }).toList(),
  ),
);
}

Widget _buildTestimonialCard(String text, String author) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 3),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        width: 2,
        color: Colors.transparent, // Set transparent to apply ShaderMask
      ),
    ),
    child: ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [Color(0xFFADB815), Color(0xFF18392A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Colors.white,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Color(0xFFADB815), Color(0xFF18392A)], // Adjust colors as needed
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                author,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Must be white for ShaderMask to work
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
