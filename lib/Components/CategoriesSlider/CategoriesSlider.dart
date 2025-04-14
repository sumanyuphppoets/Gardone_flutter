import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app/pages/Categories/categories.dart';

class CategoriesSlider extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {
      "image": "assets/images/Indoor.png", // Replace with your image path
      "title": "Indoor",
    },
    {
      "image": "assets/images/Indoor.png",
      "title": "Pots & Planter",
    },
    {
      "image": "assets/images/Indoor.png",
      "title": "Fertilizer",
    },
    {
      "image": "assets/images/Indoor.png",
      "title": "Outdoor",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0) ,
          child: Text(
            "Categories",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,

            ),
          ),
        ),
        const SizedBox(height: 10),
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            enableInfiniteScroll: false,
            viewportFraction: 0.4,
            padEnds: false,
          ),
          items: categories.map((category) {
            
            return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriesPage(
                  categoryTitle: category["title"]!,
                ),
              ),
            );
          },
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  category["image"]!,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                category["title"]!,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      }).toList(),
        ),
      ],
    );
  }
}
