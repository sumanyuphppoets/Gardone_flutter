import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  // Mock wishlist products
  List<Map<String, String>> getWishlistProducts() {
    return [
      {
    "image": "assets/images/Houseplant.png",
    "cardBg": "assets/images/Bgimg1.png",
    "name": "Aloe Vera",
    "type": "Indoor",
    "price": "₹ 35.00"
  },
  {
    "image": "assets/images/Houseplant.png",
    "cardBg": "assets/images/Bgimg2.png",
    "name": "Snake Plant",
    "type": "Indoor",
    "price": "₹ 50.75"
  },
  {
    "image": "assets/images/Houseplant.png",
    "cardBg": "assets/images/Bgimg1.png",
    "name": "Peace Lily",
    "type": "Indoor",
    "price": "₹ 45.10"
  },
  {
    "image": "assets/images/Houseplant.png",
    "cardBg": "assets/images/Bgimg2.png",
    "name": "Spider Plant",
    "type": "Indoor",
    "price": "₹ 30.00"
  },
  {
    "image": "assets/images/Houseplant.png",
    "cardBg": "assets/images/Bgimg1.png",
    "name": "Areca Palm",
    "type": "Indoor",
    "price": "₹ 60.00"
  },
  {
    "image": "assets/images/Houseplant.png",
    "cardBg": "assets/images/Bgimg2.png",
    "name": "Rubber Plant",
    "type": "Indoor",
    "price": "₹ 55.25"
  },
  {
    "image": "assets/images/Houseplant.png",
    "cardBg": "assets/images/Bgimg1.png",
    "name": "ZZ Plant",
    "type": "Indoor",
    "price": "₹ 42.00"
  },
  {
    "image": "assets/images/Houseplant.png",
    "cardBg": "assets/images/Bgimg2.png",
    "name": "Pothos",
    "type": "Indoor",
    "price": "₹ 25.00"
  },
  {
    "image": "assets/images/Houseplant.png",
    "cardBg": "assets/images/Bgimg1.png",
    "name": "Boston Fern",
    "type": "Indoor",
    "price": "₹ 38.50"
  },
  {
    "image": "assets/images/Houseplant.png",
    "cardBg": "assets/images/Bgimg2.png",
    "name": "Dracaena",
    "type": "Indoor",
    "price": "₹ 48.00"
  },
  {
    "image": "assets/images/Houseplant.png",
    "cardBg": "assets/images/Bgimg1.png",
    "name": "Fiddle Leaf Fig",
    "type": "Indoor",
    "price": "₹ 70.00"
  },
  {
    "image": "assets/images/Houseplant.png",
    "cardBg": "assets/images/Bgimg2.png",
    "name": "Calathea",
    "type": "Indoor",
    "price": "₹ 52.90"
  },
  {
    "image": "assets/images/Houseplant.png",
    "cardBg": "assets/images/Bgimg1.png",
    "name": "Chinese Evergreen",
    "type": "Indoor",
    "price": "₹ 40.40"
  },
  {
    "image": "assets/images/Houseplant.png",
    "cardBg": "assets/images/Bgimg2.png",
    "name": "Croton",
    "type": "Indoor",
    "price": "₹ 36.60"
  },
  {
    "image": "assets/images/Houseplant.png",
    "cardBg": "assets/images/Bgimg1.png",
    "name": "Money Plant",
    "type": "Indoor",
    "price": "₹ 29.99"
  }
    ];
  }

  @override
  Widget build(BuildContext context) {
    final products = getWishlistProducts();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "My Wishlist",
          style: TextStyle(
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
          onPressed: () => SystemNavigator.pop(),
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
                            'BUY',
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
