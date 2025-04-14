import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/pages/AddAddress/Address.dart';
import 'package:my_app/pages/Profile/Profile.dart';
import 'package:my_app/pages/Rewards/Rewards.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  int? _expandedTileIndex;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> accordionItems = [
      {
        "title": "Shipping and Return Policy",
        "subItems": [
          "Book a gardener",
          "Service Packages",
          "Weekly Maintenance",
        ],
      },
      {
        "title": "Contact Us",
        "subItems": [
          "Book a gardener",
          "Service Packages",
          "Weekly Maintenance",
        ],
      },
      {
        "title": "Gardnen Services & Maintenance",
        "subItems": [
          "Book a gardener",
          "Service Packages",
          "Weekly Maintenance",
        ],
      },
      {
        "title": "Privacy Policy",
        "subItems": [
          "Book a gardener",
          "Service Packages",
          "Weekly Maintenance",
        ],
      },
      {
        "title": "Terms of Service",
        "subItems": [
          "Book a gardener",
          "Service Packages",
          "Weekly Maintenance",
        ],
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'AvenirNextCyr',
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Profile Info
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/Profile.jpg'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hello Sumanyu Singh Rathore",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'AvenirNextCyr',
                      ),
                    ),
                    Text(
                      "xyz14@gmail.com",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontFamily: 'AvenirNextCyr',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),

            // Profile Options
            _buildProfileButton(
              svgAssetPath: 'assets/icons/Profile.svg',
              title: 'Profile',
              subtitle: 'Edit Your Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            _buildProfileButton(
              svgAssetPath: 'assets/icons/Rewards.svg',
              title: 'Rewards',
              subtitle: 'See how to earn rewards',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RewardsScreen()),
                );
              },
            ),
            _buildProfileButton(
              svgAssetPath: 'assets/icons/HomeDeactive.svg',
              title: 'Address Book',
              subtitle: 'Manage your saved addresses',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddressPage()),
                );
              },
            ),
            _buildProfileButton(
              svgAssetPath: 'assets/icons/Order_History.svg',
              title: 'Order History',
              subtitle: 'View your past orders',
              onTap: () {},
            ),
            _buildProfileButton(
              svgAssetPath: 'assets/icons/Change_Password.svg',
              title: 'Change Password',
              subtitle: 'Edit your password',
              onTap: () {},
            ),

            const SizedBox(height: 10),

            // Logout Button
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: const BorderSide(
                  color: Color.fromRGBO(191, 204, 151, 1),
                  width: 1.01,
                ),
              ),
              child: const Text(
                "LOG OUT",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'AvenirNextCyr',
                  color: Color.fromRGBO(24, 57, 42, 1),
                  fontSize: 20,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Accordion Items
            for (int i = 0; i < accordionItems.length; i++)
              _buildAccordionTile(
                i,
                accordionItems[i]["title"],
                accordionItems[i]["subItems"],
              ),
          ],
        ),
      ),
    );
  }

  /// Reusable Profile Button Widget
  Widget _buildProfileButton({
    required String svgAssetPath,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(173, 184, 21, 1),
                Color.fromRGBO(24, 57, 42, 1),
              ], // Green gradient
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            margin: const EdgeInsets.all(
              1.5,
            ), // thickness of the gradient border
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white, // inner background
              borderRadius: BorderRadius.circular(10.5), // slightly smaller
            ),
            child: Row(
              children: [
                SvgPicture.asset(svgAssetPath, width: 24, height: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'AvenirNextCyr',
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(24, 57, 42, 1),
                          fontFamily: 'AvenirNextCyr',
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Accordion Tile (only one expanded at a time)
  Widget _buildAccordionTile(int index, String title, List<String> subItems) {
    final bool isExpanded = _expandedTileIndex == index;

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'AvenirNextCyr',
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Icon(
              isExpanded
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
              size: 22,
            ),
            onTap: () {
              setState(() {
                _expandedTileIndex = isExpanded ? null : index;
              });
            },
          ),
          if (isExpanded)
            Column(
              children:
                  subItems
                      .map(
                        (item) => ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.only(left: 16),
                          title: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 13,
                              fontFamily: 'AvenirNextCyr',
                              color: Colors.black54,
                            ),
                          ),
                          onTap: () {
                            // Handle sub-item tap
                          },
                        ),
                      )
                      .toList(),
            ),
        ],
      ),
    );
  }
}
