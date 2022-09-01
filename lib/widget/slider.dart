import 'package:carousel_slider/carousel_slider.dart';
import 'package:digikala_ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/slider_model.dart';
import '../theme/app_spacings.dart';

class SliderWiget extends StatefulWidget {
  const SliderWiget({
    Key? key,
  }) : super(key: key);

  @override
  State<SliderWiget> createState() => _SliderState();
}

class _SliderState extends State<SliderWiget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 220,
          padding: const EdgeInsets.symmetric(vertical: AppSpacings.xxl),
          child: CarouselSlider.builder(
            itemCount: SliderModel.items.length,
            itemBuilder: (context, index, realIndex) => Container(
              margin: EdgeInsets.only(right: AppSpacings.m),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSpacings.l),
                image: DecorationImage(
                    image: AssetImage(SliderModel.items[index].image),
                    fit: BoxFit.cover),
              ),
            ),
            options: CarouselOptions(
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex=index;
                  });
                }),
          ),
        ),
        Positioned(
          left: 40,
          bottom: 40,
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: SliderModel.items.length,
            effect: ScrollingDotsEffect(
                dotHeight: 10.0,
                dotWidth: 10.0,
                activeDotColor: AppColors.black,
                dotColor: AppColors.lightGrey200,
                maxVisibleDots: 5),
          ),
        ),
      ],
    );
  }
}
