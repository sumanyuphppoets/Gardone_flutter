import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/pages/AddAddress/Address.dart';
import 'package:flutter/services.dart';
import 'package:my_app/pages/Wishlist/wishlist.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      "image": "assets/images/Houseplant.png",
      "cardBg": "assets/images/Bgimg1.png",
      "name": "Aloe Vera",
      "type": "Indoor",
      "price": 400.25,
      "quantity": 1,
    },
    {
      "image": "assets/images/Houseplant.png",
      "cardBg": "assets/images/Bgimg2.png",
      "name": "Snake Plant",
      "type": "Indoor",
      "price": 400.25,
      "quantity": 1,
    },
    {
      "image": "assets/images/Houseplant.png",
      "cardBg": "assets/images/Bgimg3.png",
      "name": "Monstera Plant",
      "type": "Indoor",
      "price": 400.25,
      "quantity": 1,
    },
  ];

  void incrementQty(int index) {
    setState(() {
      cartItems[index]["quantity"]++;
    });
  }

  void decrementQty(int index) {
    setState(() {
      if (cartItems[index]["quantity"] > 1) {
        cartItems[index]["quantity"]--;
      }
    });
  }

  double calculateTotal() {
    double total = 0;
    for (var item in cartItems) {
      total += item["price"] * item["quantity"];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    double cartTotal = calculateTotal();
    double discount = 200.75;
    double deliveryCharge = 0.0;
    double finalAmount = cartTotal - discount + deliveryCharge;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        leading: const BackButton(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.black,
              ), // Favorite icon
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Add New Address Button
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFADB815), Color(0xFF18392A)],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(1.5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddressPage(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Add New Address',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Cart Items List
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFADB815), Color(0xFF18392A)],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(1),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  item["image"],
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item["name"],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    const Text(
                                      "Select Planter: Lotus Bowl\nPlant Age: 1 Month",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      "₹ ${item["price"].toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Add your delete functionality here
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons/delete-outline.svg',
                                      width: 25,
                                      height: 25,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        'Qty:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFFADB815),
                                              Color(0xFF18392A),
                                            ],
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(1),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              GestureDetector(
                                                onTap:
                                                    () => decrementQty(index),
                                                child: const Icon(
                                                  Icons.remove,
                                                  size: 14,
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              Text('${item["quantity"]}'),
                                              const SizedBox(width: 4),
                                              GestureDetector(
                                                onTap:
                                                    () => incrementQty(index),
                                                child: const Icon(
                                                  Icons.add,
                                                  size: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  // Coupon Section
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF1E2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: SvgPicture.asset(
                        'assets/icons/coupon-line.svg', // replace with your SVG path
                        width: 24,
                        height: 24,
                        color: Color(0xFF4C6B1F),
                      ),
                      title: const Text('1 Coupon applied'),
                      subtitle: const Text(
                        'View more Coupon',
                        style: TextStyle(color: Colors.black),
                      ),
                      trailing: SvgPicture.asset(
                        'assets/icons/Rightarrow.svg', // replace with your SVG path
                        width: 16,
                        height: 16,
                      ),
                      onTap: () {},
                    ),
                  ),

                  // Price Details
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F8F3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Price Details',
                          style: TextStyle(
                            fontFamily: 'AvenirNextCyr',
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Divider(thickness: 1.2),
                        _buildPriceRow(
                          'Cart Total (${cartItems.length} item)',
                          '₹ ${cartTotal.toStringAsFixed(2)}',
                        ),
                        _buildPriceRow(
                          'Additional Discount',
                          '- ₹ ${discount.toStringAsFixed(2)}',
                        ),
                        _buildPriceRow(
                          'Delivery Charge',
                          deliveryCharge == 0
                              ? '-'
                              : '₹ ${deliveryCharge.toStringAsFixed(2)}',
                        ),
                        const SizedBox(height: 8),
                        _buildPriceRow(
                          'You Pay',
                          '₹ ${finalAmount.toStringAsFixed(2)}',
                          isBold: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(10),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xFFDCE8D6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '₹ ${finalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Grand Total',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF18392A),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Your payment function here
                    },
                    child: const Row(
                      children: [
                        Text(
                          'Proceed to Pay',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(
                          Icons.arrow_forward,
                          size: 18,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
              color: isBold ? Colors.blue.shade900 : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
