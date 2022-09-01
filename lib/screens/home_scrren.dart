import 'package:carousel_slider/carousel_slider.dart';
import '../models/digi_apps_model.dart';
import '../models/slider_model.dart';
import '../theme/app_spacings.dart';
import '../widget/offer_widget.dart';
import 'package:flutter/material.dart';
import '../widget/custom_app_bar.dart';
import '../widget/grid_logo.dart';
import '../widget/slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SliderWiget(),
            DigiGridView(),
            Offer(),
      
          ],
        ),
      ),
    );
  }
}