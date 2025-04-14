import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomTabs extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomTabs({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 0, // Prevents default sizing interference
          selectedFontSize: 0, // Avoids spacing due to label font
          unselectedFontSize: 0,
          items: [
            _buildNavItem(
              index: 0,
              iconPath: 'assets/icons/HomeDeactive.svg',
              activeIconPath: 'assets/icons/HomeActive.svg',
            ),
            _buildNavItem(
              index: 1,
              iconPath: 'assets/icons/WishlistDeactive.svg',
              activeIconPath: 'assets/icons/WishlistActive.svg',
            ),
            _buildNavItem(
              index: 2,
              iconPath: 'assets/icons/CartDeactive.svg',
              activeIconPath: 'assets/icons/CartActive.svg',
            ),
            _buildNavItem(
              index: 3,
              iconPath: 'assets/icons/ServicesDeactive.svg',
              activeIconPath: 'assets/icons/ServiceActive.svg',
            ),
          ],
          currentIndex: currentIndex,
          onTap: onTap,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required int index,
    required String iconPath,
    required String activeIconPath,
  }) {
    final bool isActive = index == currentIndex;

    return BottomNavigationBarItem(
      icon: SizedBox(
        height: 70,
        width: 60,
        child: Center(
          child: SvgPicture.asset(
            isActive ? activeIconPath : iconPath,
            height: isActive ? 70 : 20,
            width: isActive ? 70 : 20,
            fit: BoxFit.contain,
          ),
        ),
      ),
      label: '',
    );
  }
}
