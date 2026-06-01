import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/fashion1.jpg",
      "title": "Discover Trendy Fashion",
      "description": "Explore modern Gen Z fashion styles for men and women.",
    },
    {
      "image": "assets/images/fashion2.jpg",
      "title": "Couple Matching Outfits",
      "description":
          "Find stylish matching hoodies, t-shirts and travel outfits.",
    },
    {
      "image": "assets/images/fashion3.jpg",
      "title": "AI Outfit Recommendation",
      "description":
          "Get smart fashion suggestions based on your style and favorites.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingData.length,

                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },

                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(25),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          onboardingData[index]["image"]!,
                          height: 300,
                        ),

                        const SizedBox(height: 40),

                        Text(
                          onboardingData[index]["title"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFF3D5A),
                          ),
                        ),

                        const SizedBox(height: 20),

                        Text(
                          onboardingData[index]["description"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),

                  margin: const EdgeInsets.symmetric(horizontal: 4),

                  height: 10,

                  width: currentIndex == index ? 30 : 10,

                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? const Color(0xffFF3D5A)
                        : Colors.grey.shade300,

                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),

              child: SizedBox(
                width: double.infinity,
                height: 60,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFF3D5A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  onPressed: () {
                    if (currentIndex == onboardingData.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },

                  child: Text(
                    currentIndex == onboardingData.length - 1
                        ? "Get Started"
                        : "Next",

                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
