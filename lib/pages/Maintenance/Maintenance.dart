import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F1E8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text('Maintenance', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Promo Card
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage('assets/images/Maintenance-img.png'),
                  fit: BoxFit.contain,
                ),
              ),
              padding: const EdgeInsets.all(16),
            ),

            const SizedBox(height: 20),
            // Garden Maintenance Card
            serviceCard(
              title: 'Garden Maintenance',
              svgAssetPath: 'assets/icons/Garden-Maintenance.svg',
              services: [
                'One time maintenance services',
                'Potted-Exotic Garden',
                'Annual Maintenance Package',
                'Maintenance Subscription Plans',
                'Herb Garden Setup',
              ],
            ),
            const SizedBox(height: 16),
            // Vertical Garden Card
            serviceCard(
              title: 'Vertical Garden',
              svgAssetPath: 'assets/icons/Vertical-Garden.svg',
              services: [
                'One time maintenance services',
                'Potted-Exotic Garden',
                'Annual Maintenance Package',
                'Maintenance Subscription Plans',
                'Herb Garden Setup',
              ],
            ),
            const SizedBox(height: 16),
            // Vertical Garden Card
            serviceCard(
              title: 'Corporate Renting',
              svgAssetPath: 'assets/icons/Corporate-Renting.svg',
              services: [
                'One time maintenance services',
                'Potted-Exotic Garden',
                'Annual Maintenance Package',
                'Maintenance Subscription Plans',
                'Herb Garden Setup',
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceCard({
    required String title,
    required String svgAssetPath,
    required List<String> services,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(20),
        ),
        border: const Border(
          left: BorderSide(
            color: Color(0xFF1D5C2E), // Green color for the border
            width: 4, // 2px left border
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D5C2E),
                ),
                maxLines: 2, // Allow up to 2 lines
                overflow: TextOverflow.ellipsis, // Add ellipsis if it overflows
              ),

              const Spacer(),
              SvgPicture.asset(
                svgAssetPath,
                height: 60,
                width: 60,
                color: const Color(0xFF1D5C2E), // Optional tint
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...services.map(
            (s) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  const Icon(Icons.circle, size: 6, color: Colors.black),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(s, style: const TextStyle(fontSize: 14)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D5C2E),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: const Text('Enquire Now'),
          ),
        ],
      ),
    );
  }
}
