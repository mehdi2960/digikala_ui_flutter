import 'package:carousel_slider/carousel_slider.dart';
import 'package:digikala_ui/models/digi_apps_model.dart';
import 'package:digikala_ui/models/slider_model.dart';
import 'package:digikala_ui/theme/app_spacings.dart';
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
      body: Column(
        children: [
          SliderWiget(),
          DigiGridView(),
        ],
      ),
    );
  }
}