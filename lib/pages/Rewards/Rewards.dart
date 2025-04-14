import 'package:flutter/material.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coupons = List.generate(3, (index) => _buildCouponCard());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text('Rewards', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Coupons',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xff003366),
              ),
            ),
            const SizedBox(height: 16),
            ...coupons,
          ],
        ),
      ),
    );
  }

  static Widget _buildCouponCard() {
    const cutoutRadius = 20.0;
    const cutoutDiameter = cutoutRadius * 2;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 100,
      child: Stack(
        children: [
          PhysicalModel(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAlias,
            child: ClipPath(
              child: Container(
                color: const Color(0xffe1f0db),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/Rewards.png',
                      width: 80,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Extra 5% Off On',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  'Indoor Plants',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(Icons.arrow_forward_ios, size: 12),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // White circle overlays to simulate cutouts
          Positioned(
            left: -20,
            top: 50 - cutoutRadius,
            child: Container(
              width: cutoutDiameter,
              height: cutoutDiameter,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: -20,
            top: 50 - cutoutRadius,
            child: Container(
              width: cutoutDiameter,
              height: cutoutDiameter,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
