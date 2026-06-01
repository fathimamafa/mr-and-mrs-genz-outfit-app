import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int currentIndex = 0;

  final List<Map<String, String>> banners = [
    {
      "title": "Flash Sale",
      "subtitle": "Up to 50% OFF",
      "image": "assets/images/flash_sale.jpg",
    },
    {
      "title": "Couple Collection",
      "subtitle": "Trending Matching Outfits",
      "image": "assets/images/couple.jpg",
    },
    {
      "title": "New Arrivals",
      "subtitle": "Discover Gen Z Fashion",
      "image": "assets/images/arrivals.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SLIDER
        CarouselSlider.builder(
          itemCount: banners.length,
          itemBuilder: (context, index, realIndex) {
            final banner = banners[index];

            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                    banner["image"]!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(
                        0.7,
                      ),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        banner["title"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        banner["subtitle"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                            0xffFF3D5A,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Shop Now",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 220,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            autoPlayInterval: const Duration(
              seconds: 3,
            ),
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),

        const SizedBox(height: 15),

        /// INDICATORS
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (index) {
              bool isActive = currentIndex == index;

              return AnimatedContainer(
                duration: const Duration(
                  milliseconds: 300,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                width: isActive ? 25 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(
                          0xffFF3D5A,
                        )
                      : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
