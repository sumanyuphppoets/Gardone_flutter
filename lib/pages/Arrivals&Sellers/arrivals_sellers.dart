import 'package:flutter/material.dart';

class ArrivalsSellersPage extends StatelessWidget {
  final String title;

  const ArrivalsSellersPage({
    super.key,
    required this.title,
  });

  List<Map<String, String>> getProductsByTitle(String title) {
    // Sample product data based on title
    if (title == "New Arrivals") {
      return [
        {
          "image": "assets/images/Houseplant.png",
          "cardBg": "assets/images/Bgimg1.png",
          "name": "Monstera",
          "type": "Outdoor",
          "price": "₹ 40.25"
        },
        {
          "image": "assets/images/Houseplant.png",
          "cardBg": "assets/images/Bgimg2.png",
          "name": "Monstera",
          "type": "Outdoor",
          "price": "₹ 40.25"
        },
        {
          "image": "assets/images/Houseplant.png",
          "cardBg": "assets/images/Bgimg1.png",
          "name": "Monstera",
          "type": "Outdoor",
          "price": "₹ 40.25"
        },
        {
          "image": "assets/images/Houseplant.png",
          "cardBg": "assets/images/Bgimg2.png",
          "name": "Monstera",
          "type": "Outdoor",
          "price": "₹ 40.25"
        },
        {
          "image": "assets/images/Houseplant.png",
          "cardBg": "assets/images/Bgimg1.png",
          "name": "Monstera",
          "type": "Outdoor",
          "price": "₹ 40.25"
        },
        {
          "image": "assets/images/Houseplant.png",
          "cardBg": "assets/images/Bgimg2.png",
          "name": "Monstera",
          "type": "Outdoor",
          "price": "₹ 40.25"
        },
        {
          "image": "assets/images/Houseplant.png",
          "cardBg": "assets/images/Bgimg1.png",
          "name": "Monstera",
          "type": "Outdoor",
          "price": "₹ 40.25"
        },
        {
          "image": "assets/images/Houseplant.png",
          "cardBg": "assets/images/Bgimg2.png",
          "name": "Monstera",
          "type": "Outdoor",
          "price": "₹ 40.25"
        },
        // Add more items...
      ];
    } else if (title == "Best Sellers") {
      return [
        {
          "image": "assets/images/Houseplant.png",
          "cardBg": "assets/images/Bgimg1.png",
          "name": "Monstera",
          "type": "Outdoor",
          "price": "₹ 40.25"
        },
        {
          "image": "assets/images/Houseplant.png",
          "cardBg": "assets/images/Bgimg2.png",
          "name": "Monstera",
          "type": "Outdoor",
          "price": "₹ 40.25"
        },
        {
          "image": "assets/images/Houseplant.png",
          "cardBg": "assets/images/Bgimg1.png",
          "name": "Monstera",
          "type": "Outdoor",
          "price": "₹ 40.25"
        },
        {
          "image": "assets/images/Houseplant.png",
          "cardBg": "assets/images/Bgimg2.png",
          "name": "Monstera",
          "type": "Outdoor",
          "price": "₹ 40.25"
        },
        {
          "image": "assets/images/Houseplant.png",
          "cardBg": "assets/images/Bgimg1.png",
          "name": "Monstera",
          "type": "Outdoor",
          "price": "₹ 40.25"
        },
        {
          "image": "assets/images/Houseplant.png",
          "cardBg": "assets/images/Bgimg2.png",
          "name": "Monstera",
          "type": "Outdoor",
          "price": "₹ 40.25"
        },
        {
          "image": "assets/images/Houseplant.png",
          "cardBg": "assets/images/Bgimg1.png",
          "name": "Monstera",
          "type": "Outdoor",
          "price": "₹ 40.25"
        },
        {
          "image": "assets/images/Houseplant.png",
          "cardBg": "assets/images/Bgimg2.png",
          "name": "Monstera",
          "type": "Outdoor",
          "price": "₹ 40.25"
        },
        // Add more items...
      ];
    }

    // Default or other title logic
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final products = getProductsByTitle(title);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontFamily: 'AvenirNextCyr',
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(product["cardBg"]!),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            product["image"]!,
                            width: 150,
                            height: 120,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product["name"]!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'AvenirNextCyr',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      product["type"]!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'AvenirNextCyr',
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      product["price"]!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 32,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'ADD',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
