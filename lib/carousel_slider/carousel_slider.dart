import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:sewnest/presentation/role_selection.dart';

import '../utilis/styles/customColors.dart';

class CarouselSliderScreen extends StatefulWidget {
  @override
  _CarouselSliderScreenState createState() => _CarouselSliderScreenState();
}

class _CarouselSliderScreenState extends State<CarouselSliderScreen> {
  int _currentIndex = 0;

  final List<String> images = [
    "assets/images/measurement.jpg",
    "assets/images/tailor.jpg",
    "assets/images/user.jpg"
  ];

  void _updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                'Welcome to Tailor App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.secondaryColor,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  'Experience custom tailoring at its best. Choose fabrics, get perfect measurements, and enjoy premium services.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              CarouselSlider(
                items: images.map((image) {
                  bool isActive = images.indexOf(image) == _currentIndex;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                          height: isActive ? 300 : 250,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  height: 400,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    _updateIndex(index);
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 50,
            left: 20,
            child: TextButton(
              onPressed: () {
             Get.to(() => RoleSelectionScreen());
              },
              child: const Text(
                'Skip',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => RoleSelectionScreen());
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                  backgroundColor: CustomColors.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index ? CustomColors.secondaryColor : Colors.grey,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
