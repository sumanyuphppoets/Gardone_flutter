import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app/Components/Cardslider/cardslider.dart';
import 'package:my_app/pages/Wishlist/wishlist.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:clipboard/clipboard.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;
  String selectedPlanter = "Lotus Bowl";
  String selectedAge = "1 Month";
  int _currentIndex = 0;

  // States to track which Review Category is expanded
  bool isFirstExpanded = false;
  bool isSecondExpanded = false;
  bool isThirdExpanded = false;
  bool isFourthExpanded = false;

  final List<String> imageList = [
    'assets/images/Product_details.png',
    'assets/images/Product_details.png',
    'assets/images/Product_details.png',
  ];

  // List of dynamic data for the review categories
  final List<Map<String, String>> reviewDetails = [
    {
      'title': 'Water Once A Week',
      'details':
          'This is a detailed description of Review Category 1. This section could contain more information about the product category.',
    },
    {
      'title': 'Need Bright Indirect Sunlight',
      'details':
          'This is a detailed description of Review Category 2. Here, you can add user reviews, ratings, or specific product information.',
    },
    {
      'title': 'Not Pet Friendly',
      'details':
          'This is a detailed description of Review Category 3. More detailed and dynamic content related to this category can be shown here.',
    },
    {
      'title': 'Beginner Friendly',
      'details':
          'This is a detailed description of Review Category 4. You could include specifications or other important product information.',
    },
  ];
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

  void _toggleReviewExpansion(int index) {
    setState(() {
      if (index == 1) {
        isFirstExpanded = !isFirstExpanded;
        isSecondExpanded = false;
        isThirdExpanded = false;
        isFourthExpanded = false;
      } else if (index == 2) {
        isSecondExpanded = !isSecondExpanded;
        isFirstExpanded = false;
        isThirdExpanded = false;
        isFourthExpanded = false;
      } else if (index == 3) {
        isThirdExpanded = !isThirdExpanded;
        isFirstExpanded = false;
        isSecondExpanded = false;
        isFourthExpanded = false;
      } else if (index == 4) {
        isFourthExpanded = !isFourthExpanded;
        isFirstExpanded = false;
        isSecondExpanded = false;
        isThirdExpanded = false;
      }
    });
  }

  void _shareOnWhatsApp() async {
    String url = "whatsapp://send?text=Check%20out%20this%20product!";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("WhatsApp is not installed.");
    }
  }

  void _copyToClipboard() {
    FlutterClipboard.copy('Check out this amazing product!').then((value) {
      print("Text copied to clipboard!");
    });
  }

  // Function to handle generic share
  void _shareProduct() {
    Share.share('Check out this amazing product!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const Text(
          "Product Detail",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WishlistPage()),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Slider
              CarouselSlider(
                options: CarouselOptions(
                  height: 250,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items:
                    imageList.map((imagePath) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    }).toList(),
              ),
              const SizedBox(height: 12),

              // Dots Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    imageList.asMap().entries.map((entry) {
                      return Container(
                        width: _currentIndex == entry.key ? 35.0 : 20.0,
                        height: 10.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color:
                              _currentIndex == entry.key
                                  ? Colors.green.shade900
                                  : Colors.grey.shade300,
                        ),
                      );
                    }).toList(),
              ),
              const SizedBox(height: 16),

              // Product title and rating
              const Text(
                "Product Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star_half, color: Colors.amber, size: 16),
                  Icon(Icons.star_border, color: Colors.amber, size: 16),
                ],
              ),
              const SizedBox(height: 6),

              // Price & Discount
              Row(
                children: [
                  const Text(
                    "₹499",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "₹1999",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "21% OFF",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Select Planter
              const Text(
                "Select Planter:",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Wrap(
                spacing: 10,
                children:
                    ["Lotus Bowl", "Ceramic Bowl"].map((option) {
                      final isSelected = selectedPlanter == option;
                      return ChoiceChip(
                        label: Text(
                          option,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: Colors.green.shade900,
                        backgroundColor: Colors.white.withOpacity(0.6),
                        onSelected: (_) {
                          setState(() => selectedPlanter = option);
                        },
                      );
                    }).toList(),
              ),

              const SizedBox(height: 16),

              // Plant Age
              const Text(
                "Plant Age:",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Wrap(
                spacing: 10,
                children:
                    ["1 Month", "3 Month", "6 Month"].map((option) {
                      final isSelected = selectedAge == option;
                      return ChoiceChip(
                        label: Text(
                          option,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: Colors.green.shade900,
                        backgroundColor: Colors.white.withOpacity(0.6),
                        onSelected: (_) {
                          setState(() => selectedAge = option);
                        },
                      );
                    }).toList(),
              ),

              const SizedBox(height: 16),

              // Quantity Selector
              const Text(
                "Quantity:",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  // Minus Button
                  GestureDetector(
                    onTap:
                        quantity > 1 ? () => setState(() => quantity--) : null,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(Icons.remove, size: 15),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Quantity Text
                  Text(
                    quantity.toString().padLeft(2, '0'),
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 12),

                  // Plus Button
                  GestureDetector(
                    onTap: () => setState(() => quantity++),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(Icons.add, size: 15),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Description
              ExpansionTile(
                title: const Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                initiallyExpanded: true,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Add a touch of vibrant tradition to your jewelry collection with our Authentic Maasai Beaded Bracelet. "
                      "Handcrafted by skilled Maasai artisans, this stunning bracelet showcases the rich cultural heritage and artistry "
                      "of the Maasai people of East Africa.",
                      style: TextStyle(height: 1.4),
                    ),
                  ),
                ],
              ),

              // Reviews
              ExpansionTile(
                title: const Text(
                  "Reviews",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                children: [
                  // Card widget under "Add a Review"
                  Card(
                    elevation: 0,
                    margin: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        _buildExpansionTile(0),
                        _buildExpansionTile(1),
                        _buildExpansionTile(2),
                        _buildExpansionTile(3),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // Adjust alignment as needed
                children: [
                  Text(
                    "Share product:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10), // Space between text and icons

                  GestureDetector(
                    onTap: _shareProduct,
                    child: SvgPicture.asset(
                      'assets/icons/Shareicon.svg', // Path to your Share icon
                      width: 30,
                      height: 30,
                    ),
                  ),
                  SizedBox(width: 10), // Space between icons
                  GestureDetector(
                    onTap: _copyToClipboard,
                    child: SvgPicture.asset(
                      'assets/icons/copyicon.svg', // Path to your Copy icon
                      width: 30,
                      height: 30,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: _shareOnWhatsApp,
                    child: SvgPicture.asset(
                      'assets/icons/Whatsappicon.svg', // Path to your WhatsApp icon
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Product title and rating
              CardSlider(
                title: "Frequently Bought Together",
                items: newArrivals,
                user: false,
              ),
              const SizedBox(height: 16),
              // Product title and rating
              CardSlider(
                title: "Similar Products",
                items: bestSellers,
                user: false,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Buy Now
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: Color(0xFF18392A),
                              width: .5,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(
                            color: Color(0xFF18392A),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Add to Cart
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Color(0xFF18392A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpansionTile(int index) {
    return Container(
      decoration: BoxDecoration(
        // Remove borders entirely
        border: Border.all(
          color: Colors.transparent, // Set border color to transparent
          width: 0, // Set border width to 0
        ),
      ),
      child: ExpansionTile(
        title: Text(reviewDetails[index]['title'] ?? 'Unknown Title'),
        initiallyExpanded:
            index == 0
                ? isFirstExpanded
                : (index == 1
                    ? isSecondExpanded
                    : (index == 2 ? isThirdExpanded : isFourthExpanded)),
        onExpansionChanged: (bool expanded) {
          _toggleReviewExpansion(index + 1);
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              reviewDetails[index]['details'] ??
                  'No details available for this category.',
            ),
          ),
        ],
      ),
    );
  }
}
