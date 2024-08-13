import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdvertisingSlider extends StatelessWidget {
  AdvertisingSlider({super.key});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        2,
        (index) => InkWell(
          child: Container(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/product1.jpg'),
                fit: BoxFit.cover,
              ),
              color: const Color(0xFFB2BBCE).withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      options: CarouselOptions(
        height: 180,
        viewportFraction: 0.8,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        //enlargeCenterPage: true,
      ),
    );
  }
}
