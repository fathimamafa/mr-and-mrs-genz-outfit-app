import 'package:flutter/material.dart';

class AIRecommendationScreen extends StatefulWidget {
  const AIRecommendationScreen({super.key});

  @override
  State<AIRecommendationScreen> createState() => _AIRecommendationScreenState();
}

class _AIRecommendationScreenState extends State<AIRecommendationScreen> {
  /// SELECTED FILTERS
  String selectedCategory = "Men";
  String selectedColor = "All";
  String selectedPrice = "All";

  /// COLORS
  final Color primaryColor = const Color(0xffFF4D6D);
  final Color darkColor = const Color(0xff121212);

  /// RECOMMENDED PRODUCTS
  List<Map<String, dynamic>> recommended = [];

  /// PRODUCTS DATABASE
  final List<Map<String, dynamic>> products = [
    {
      "name": "Couple Hoodie",
      "category": "Couple Sets",
      "color": "Black",
      "price": 14500,
      "rating": 4.8,
      "image": "assets/images/1.jpg",
      "description": "Premium Gen Z matching hoodie",
    },
    {
      "name": "Fashion Jacket",
      "category": "Jackets",
      "color": "Brown",
      "price": 22000,
      "rating": 4.7,
      "image": "assets/images/2.jpg",
      "description": "Modern stylish Gen Z jacket",
    },
    {
      "name": "Modern Sneakers",
      "category": "Shoes",
      "color": "White",
      "price": 17500,
      "rating": 4.9,
      "image": "assets/images/3.jpg",
      "description": "Comfortable trendy sneakers",
    },
    {
      "name": "Streetwear Outfit",
      "category": "Men",
      "color": "Black",
      "price": 26500,
      "rating": 4.6,
      "image": "assets/images/4.jpg",
      "description": "Oversized trendy fashion set",
    },
    {
      "name": "Classic Black Hoodie",
      "category": "Men",
      "color": "Black",
      "price": 13500,
      "rating": 4.7,
      "image": "assets/images/5.jpg",
      "description": "Warm oversized street hoodie",
    },
    {
      "name": "Elegant Women Dress",
      "category": "Women",
      "color": "Red",
      "price": 20500,
      "rating": 4.9,
      "image": "assets/images/6.jpg",
      "description": "Beautiful modern dress for women",
    },
    {
      "name": "White Sneakers",
      "category": "Shoes",
      "color": "White",
      "price": 16000,
      "rating": 4.8,
      "image": "assets/images/7.jpg",
      "description": "Comfortable casual sneakers",
    },
    {
      "name": "Denim Jacket",
      "category": "Jackets",
      "color": "Blue",
      "price": 21500,
      "rating": 4.6,
      "image": "assets/images/8.jpg",
      "description": "Stylish blue denim jacket",
    },
    {
      "name": "Luxury Watch",
      "category": "Accessories",
      "color": "Black",
      "price": 35000,
      "rating": 4.9,
      "image": "assets/images/9.jpg",
      "description": "Modern stylish watch",
    },
    {
      "name": "Couple T-Shirt Set",
      "category": "Couple Sets",
      "color": "White",
      "price": 17000,
      "rating": 4.8,
      "image": "assets/images/10.jpg",
      "description": "Matching outfit for couples",
    },
    {
      "name": "Urban Street Hoodie",
      "category": "Men",
      "color": "Black",
      "price": 18500,
      "rating": 4.8,
      "image": "assets/images/47.jpg",
      "description": "Trendy oversized hoodie for everyday wear",
    },
    {
      "name": "Women Casual Blouse",
      "category": "Women",
      "color": "White",
      "price": 12500,
      "rating": 4.7,
      "image": "assets/images/49.jpg",
      "description": "Elegant soft casual blouse",
    },
    {
      "name": "Chunky Sneakers",
      "category": "Shoes",
      "color": "White",
      "price": 29500,
      "rating": 4.9,
      "image": "assets/images/36.jpg",
      "description": "Gen Z trendy chunky shoes",
    },
    {
      "name": "Women Long Coat",
      "category": "Women",
      "color": "Cream",
      "price": 39000,
      "rating": 4.9,
      "image": "assets/images/31.jpg",
      "description": "Elegant winter long coat",
    },
    {
      "name": "Formal Suit Set",
      "category": "Men",
      "color": "Black",
      "price": 68000,
      "rating": 4.9,
      "image": "assets/images/43.jpg",
      "description": "Premium modern formal suit",
    },
    {
      "name": "Luxury Evening Gown",
      "category": "Women",
      "color": "Gold",
      "price": 58000,
      "rating": 4.9,
      "image": "assets/images/44.jpg",
      "description": "Elegant party gown",
    },
    {
      "name": "Sports Cap",
      "category": "Accessories",
      "color": "Black",
      "price": 5500,
      "rating": 4.2,
      "image": "assets/images/45.jpg",
      "description": "Adjustable casual cap",
    },
    {
      "name": "Running Shorts",
      "category": "Men",
      "color": "Grey",
      "price": 8500,
      "rating": 4.4,
      "image": "assets/images/46.jpg",
      "description": "Comfortable lightweight shorts",
    },
    {
      "name": "Urban Street Hoodie",
      "category": "Men",
      "color": "Black",
      "price": 18500,
      "rating": 4.8,
      "image": "assets/images/47.jpg",
      "description": "Trendy oversized hoodie for everyday wear",
    },
    {
      "name": "Vintage Denim Jeans",
      "category": "Men",
      "color": "Blue",
      "price": 19500,
      "rating": 4.6,
      "image": "assets/images/48.jpg",
      "description": "Classic relaxed fit denim jeans",
    },
    {
      "name": "Women Casual Blouse",
      "category": "Women",
      "color": "White",
      "price": 12500,
      "rating": 4.7,
      "image": "assets/images/49.jpg",
      "description": "Elegant soft casual blouse",
    },
    {
      "name": "Classic High Heels",
      "category": "Shoes",
      "color": "Black",
      "price": 28500,
      "rating": 4.9,
      "image": "assets/images/50.jpg",
      "description": "Elegant high heels for parties",
    },
    {
      "name": "Minimal Wrist Watch",
      "category": "Accessories",
      "color": "Silver",
      "price": 39000,
      "rating": 4.9,
      "image": "assets/images/51.jpg",
      "description": "Luxury minimalist fashion watch",
    },
    {
      "name": "Couple Oversized T-Shirts",
      "category": "Couple Sets",
      "color": "White",
      "price": 18000,
      "rating": 4.8,
      "image": "assets/images/52.jpg",
      "description": "Cute matching oversized tees",
    },
    {
      "name": "Luxury Travel Bag",
      "category": "Accessories",
      "color": "Brown",
      "price": 27000,
      "rating": 4.6,
      "image": "assets/images/54.jpg",
      "description": "Spacious premium travel backpack",
    },
    {
      "name": "Sport Running Shoes",
      "category": "Shoes",
      "color": "Blue",
      "price": 24000,
      "rating": 4.9,
      "image": "assets/images/55.jpg",
      "description": "Comfortable shoes for daily running",
    },
    {
      "name": "Women Long Skirt",
      "category": "Women",
      "color": "Black",
      "price": 14500,
      "rating": 4.5,
      "image": "assets/images/56.jpg",
      "description": "Elegant high waist long skirt",
    },
    {
      "name": "Streetwear Cargo Jacket",
      "category": "Jackets",
      "color": "Khaki",
      "price": 34000,
      "rating": 4.8,
      "image": "assets/images/57.jpg",
      "description": "Modern oversized cargo jacket",
    },
    {
      "name": "Luxury Gold Necklace",
      "category": "Accessories",
      "color": "Gold",
      "price": 42000,
      "rating": 4.9,
      "image": "assets/images/58.jpg",
      "description": "Stylish premium necklace",
    },
    {
      "name": "Relaxed Fit Sweatpants",
      "category": "Men",
      "color": "Grey",
      "price": 13500,
      "rating": 4.4,
      "image": "assets/images/59.jpg",
      "description": "Soft comfortable sweatpants",
    },
    {
      "name": "Women Winter Sweater",
      "category": "Women",
      "color": "White",
      "price": 16500,
      "rating": 4.7,
      "image": "assets/images/60.jpg",
      "description": "Warm knitted winter sweater",
    },
    {
      "name": "Couple Casual Outfit",
      "category": "Couple Sets",
      "color": "Black",
      "price": 48000,
      "rating": 4.9,
      "image": "assets/images/61.jpg",
      "description": "Matching casual streetwear set",
    },
    {
      "name": "Retro Sunglasses",
      "category": "Accessories",
      "color": "Black",
      "price": 9500,
      "rating": 4.5,
      "image": "assets/images/62.jpg",
      "description": "Vintage style trendy sunglasses",
    },
    {
      "name": "Luxury Leather Boots",
      "category": "Shoes",
      "color": "Brown",
      "price": 38000,
      "rating": 4.8,
      "image": "assets/images/63.jpg",
      "description": "Premium winter leather boots",
    },
    {
      "name": "Oversized Knit Hoodie",
      "category": "Men",
      "color": "Grey",
      "price": 20500,
      "rating": 4.6,
      "image": "assets/images/64.jpg",
      "description": "Soft knitted oversized hoodie",
    },
    {
      "name": "Elegant Party Dress",
      "category": "Women",
      "color": "Red",
      "price": 44000,
      "rating": 4.9,
      "image": "assets/images/65.jpg",
      "description": "Beautiful luxury party dress",
    },
    {
      "name": "Minimal Crossbody Bag",
      "category": "Accessories",
      "color": "Black",
      "price": 16000,
      "rating": 4.6,
      "image": "assets/images/66.jpg",
      "description": "Stylish everyday crossbody bag",
    },
    {
      "name": "Premium Varsity Jacket",
      "category": "Jackets",
      "color": "Black",
      "price": 36500,
      "rating": 4.8,
      "image": "assets/images/67.jpg",
      "description": "Classic varsity jacket with modern fit",
    },
    {
      "name": "Relaxed Fit Hoodie",
      "category": "Men",
      "color": "Grey",
      "price": 16500,
      "rating": 4.5,
      "image": "assets/images/68.jpg",
      "description": "Soft cotton hoodie for daily wear",
    },
    {
      "name": "Women Office Blazer",
      "category": "Women",
      "color": "Black",
      "price": 31500,
      "rating": 4.7,
      "image": "assets/images/69.jpg",
      "description": "Elegant slim fit office blazer",
    },
    {
      "name": "Canvas Street Sneakers",
      "category": "Shoes",
      "color": "White",
      "price": 18500,
      "rating": 4.6,
      "image": "assets/images/70.jpg",
      "description": "Lightweight casual sneakers",
    },
    {
      "name": "Modern Smart Watch",
      "category": "Accessories",
      "color": "Black",
      "price": 46000,
      "rating": 4.9,
      "image": "assets/images/71.jpg",
      "description": "Stylish digital smartwatch",
    },
    {
      "name": "Couple Winter Hoodies",
      "category": "Couple Sets",
      "color": "White",
      "price": 29000,
      "rating": 4.8,
      "image": "assets/images/72.jpg",
      "description": "Warm matching winter hoodie set",
    },
    {
      "name": "Slim Fit Trousers",
      "category": "Men",
      "color": "Black",
      "price": 17500,
      "rating": 4.4,
      "image": "assets/images/73.jpg",
      "description": "Modern slim fit formal trousers",
    },
    {
      "name": "Luxury Silk Dress",
      "category": "Women",
      "color": "Red",
      "price": 55000,
      "rating": 4.9,
      "image": "assets/images/74.jpg",
      "description": "Elegant silk evening dress",
    },
    {
      "name": "Leather Wallet",
      "category": "Accessories",
      "color": "Brown",
      "price": 12500,
      "rating": 4.5,
      "image": "assets/images/75.jpg",
      "description": "Premium genuine leather wallet",
    },
    {
      "name": "High Top Sneakers",
      "category": "Shoes",
      "color": "Black",
      "price": 26000,
      "rating": 4.8,
      "image": "assets/images/76.jpg",
      "description": "Trendy high top street sneakers",
    },
    {
      "name": "Classic Denim Jacket",
      "category": "Jackets",
      "color": "Blue",
      "price": 27500,
      "rating": 4.7,
      "image": "assets/images/77.jpg",
      "description": "Vintage inspired denim jacket",
    },
    {
      "name": "Oversized Sweatshirt",
      "category": "Men",
      "color": "Grey",
      "price": 14500,
      "rating": 4.5,
      "image": "assets/images/78.jpg",
      "description": "Comfortable oversized sweatshirt",
    },
    {
      "name": "Women Casual Cardigan",
      "category": "Women",
      "color": "Cream",
      "price": 18500,
      "rating": 4.6,
      "image": "assets/images/79.jpg",
      "description": "Soft knitted casual cardigan",
    },
    {
      "name": "Luxury Bracelet",
      "category": "Accessories",
      "color": "Gold",
      "price": 13500,
      "rating": 4.4,
      "image": "assets/images/80.jpg",
      "description": "Elegant fashion bracelet",
    },
    {
      "name": "Sport Training Shoes",
      "category": "Shoes",
      "color": "Blue",
      "price": 24500,
      "rating": 4.8,
      "image": "assets/images/81.jpg",
      "description": "Comfortable gym training shoes",
    },
    {
      "name": "Street Style Cargo Pants",
      "category": "Men",
      "color": "Khaki",
      "price": 19500,
      "rating": 4.7,
      "image": "assets/images/82.jpg",
      "description": "Baggy cargo pants with modern style",
    },
    {
      "name": "Elegant Women Handbag",
      "category": "Accessories",
      "color": "Brown",
      "price": 36500,
      "rating": 4.9,
      "image": "assets/images/83.jpg",
      "description": "Luxury handbag with premium leather",
    },
    {
      "name": "Urban Couple Tracksuit",
      "category": "Couple Sets",
      "color": "Black",
      "price": 48500,
      "rating": 4.8,
      "image": "assets/images/84.jpg",
      "description": "Matching tracksuit for couples",
    },
    {
      "name": "Classic White Sneakers",
      "category": "Shoes",
      "color": "White",
      "price": 21500,
      "rating": 4.7,
      "image": "assets/images/85.jpg",
      "description": "Minimalist everyday sneakers",
    },
    {
      "name": "Premium Wool Coat",
      "category": "Women",
      "color": "Beige",
      "price": 58000,
      "rating": 4.9,
      "image": "assets/images/86.jpg",
      "description": "Elegant warm winter coat",
    },
    {
      "name": "Casual Men Polo",
      "category": "Men",
      "color": "Blue",
      "price": 10500,
      "rating": 4.4,
      "image": "assets/images/87.jpg",
      "description": "Comfortable cotton polo shirt",
    },
    {
      "name": "Luxury Earrings",
      "category": "Accessories",
      "color": "Gold",
      "price": 15500,
      "rating": 4.6,
      "image": "assets/images/88.jpg",
      "description": "Elegant gold plated earrings",
    },
    {
      "name": "Chunky Running Sneakers",
      "category": "Shoes",
      "color": "White",
      "price": 29500,
      "rating": 4.8,
      "image": "assets/images/89.jpg",
      "description": "Fashionable sporty sneakers",
    },
    {
      "name": "Oversized Women Hoodie",
      "category": "Women",
      "color": "Pink",
      "price": 18500,
      "rating": 4.7,
      "image": "assets/images/90.jpg",
      "description": "Soft oversized hoodie for women",
    },
    {
      "name": "Modern Denim Shirt",
      "category": "Men",
      "color": "Blue",
      "price": 16500,
      "rating": 4.5,
      "image": "assets/images/91.jpg",
      "description": "Stylish denim casual shirt",
    },
    {
      "name": "Minimal Leather Backpack",
      "category": "Accessories",
      "color": "Black",
      "price": 31500,
      "rating": 4.8,
      "image": "assets/images/92.jpg",
      "description": "Premium backpack for travel and work",
    },
    {
      "name": "Couple Matching Jackets",
      "category": "Couple Sets",
      "color": "Blue",
      "price": 62000,
      "rating": 4.9,
      "image": "assets/images/93.jpg",
      "description": "Trendy matching jackets for couples",
    },
    {
      "name": "Women Summer Top",
      "category": "Women",
      "color": "White",
      "price": 9500,
      "rating": 4.5,
      "image": "assets/images/94.jpg",
      "description": "Lightweight stylish summer top",
    },
    {
      "name": "Luxury Running Shoes",
      "category": "Shoes",
      "color": "Black",
      "price": 39500,
      "rating": 4.9,
      "image": "assets/images/95.jpg",
      "description": "Premium comfort running sneakers",
    },
    {
      "name": "Casual Zip Hoodie",
      "category": "Men",
      "color": "Grey",
      "price": 14500,
      "rating": 4.4,
      "image": "assets/images/96.jpg",
      "description": "Comfortable zip-up hoodie",
    },
    {
      "name": "Elegant Silk Scarf",
      "category": "Accessories",
      "color": "Red",
      "price": 8000,
      "rating": 4.3,
      "image": "assets/images/97.jpg",
      "description": "Luxury soft silk scarf",
    },
    {
      "name": "Streetwear Jogger Set",
      "category": "Men",
      "color": "Black",
      "price": 37000,
      "rating": 4.8,
      "image": "assets/images/98.jpg",
      "description": "Matching hoodie and jogger set",
    },
    {
      "name": "Women Elegant Heels",
      "category": "Shoes",
      "color": "Black",
      "price": 33000,
      "rating": 4.8,
      "image": "assets/images/99.jpg",
      "description": "Luxury high heels for special events",
    },
    {
      "name": "Premium Aviator Sunglasses",
      "category": "Accessories",
      "color": "Black",
      "price": 12000,
      "rating": 4.5,
      "image": "assets/images/100.jpg",
      "description": "Modern UV protection sunglasses",
    },
    {
      "name": "Luxury Couple Outfit",
      "category": "Couple Sets",
      "color": "Black",
      "price": 72000,
      "rating": 4.9,
      "image": "assets/images/101.jpg",
      "description": "Premium matching fashion set",
    },
  ];

  /// AI RECOMMENDATION LOGIC
  void generateRecommendations() {
    recommended = products.where((item) {
      bool categoryMatch = item["category"] == selectedCategory;

      bool colorMatch =
          selectedColor == "All" ? true : item["color"] == selectedColor;

      bool priceMatch = true;

      if (selectedPrice == "Below 20K") {
        priceMatch = item["price"] < 20000;
      } else if (selectedPrice == "20K - 50K") {
        priceMatch = item["price"] >= 20000 && item["price"] <= 50000;
      } else if (selectedPrice == "Luxury") {
        priceMatch = item["price"] > 50000;
      }

      return categoryMatch && colorMatch && priceMatch;
    }).toList();

    recommended.sort(
      (a, b) => b["rating"].compareTo(a["rating"]),
    );

    setState(() {});
  }

  /// FORMAT PRICE
  String formatPrice(int price) {
    return "LKR ${price.toString()}";
  }

  /// CUSTOM DROPDOWN
  Widget buildDropdown({
    required String value,
    required String title,
    required List<String> items,
    required IconData icon,
    required Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: primaryColor,
          ),
          labelText: title,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: darkColor,
        ),
        title: Text(
          "AI Fashion Stylist",
          style: TextStyle(
            color: darkColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TOP BANNER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: LinearGradient(
                    colors: [
                      primaryColor,
                      const Color(0xffFF758F),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "✨ AI Outfit Recommendation",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Discover trending Gen Z fashion based on your vibe, favorite colors, and budget.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(
                          14,
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.auto_awesome,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Powered by Smart AI",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// CATEGORY
              buildDropdown(
                value: selectedCategory,
                title: "Select Category",
                icon: Icons.category,
                items: const [
                  "Men",
                  "Women",
                  "Shoes",
                  "Jackets",
                  "Accessories",
                  "Couple Sets",
                ],
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              /// COLOR
              buildDropdown(
                value: selectedColor,
                title: "Favorite Color",
                icon: Icons.palette,
                items: const [
                  "All",
                  "Black",
                  "White",
                  "Blue",
                  "Pink",
                  "Red",
                  "Brown",
                  "Grey",
                ],
                onChanged: (value) {
                  setState(() {
                    selectedColor = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              /// PRICE
              buildDropdown(
                value: selectedPrice,
                title: "Budget Range",
                icon: Icons.payments,
                items: const [
                  "All",
                  "Below 20K",
                  "20K - 50K",
                  "Luxury",
                ],
                onChanged: (value) {
                  setState(() {
                    selectedPrice = value!;
                  });
                },
              ),

              const SizedBox(height: 30),

              /// BUTTON
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        18,
                      ),
                    ),
                  ),
                  onPressed: generateRecommendations,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Generate AI Recommendations",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 35),

              /// TITLE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended For You",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: darkColor,
                    ),
                  ),
                  Icon(
                    Icons.local_fire_department,
                    color: primaryColor,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// EMPTY STATE
              if (recommended.isEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(
                    40,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      24,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        size: 80,
                        color: primaryColor,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "No Recommendations Yet",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: darkColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Choose your style preferences to get personalized AI fashion recommendations.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

              /// RESULTS
              if (recommended.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recommended.length,
                  itemBuilder: (context, index) {
                    final item = recommended[index];

                    return Container(
                      margin: const EdgeInsets.only(
                        bottom: 22,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          24,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 12,
                            offset: const Offset(
                              0,
                              5,
                            ),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// IMAGE
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(
                                24,
                              ),
                            ),
                            child: Image.asset(
                              item["image"],
                              height: 240,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(
                              18,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item["name"],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: darkColor,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: primaryColor.withOpacity(
                                          0.1,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          12,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 18,
                                            color: primaryColor,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            item["rating"].toString(),
                                            style: TextStyle(
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  item["description"],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.palette,
                                      size: 18,
                                      color: primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      item["color"],
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.category,
                                      size: 18,
                                      color: primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      item["category"],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      formatPrice(
                                        item["price"],
                                      ),
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor,
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: darkColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
