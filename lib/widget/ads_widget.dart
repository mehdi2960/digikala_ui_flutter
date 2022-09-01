
import 'package:flutter/material.dart';

import '../models/ads_model.dart';

class AdsGridView extends StatelessWidget {
  const AdsGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(7.0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          childAspectRatio: 1.5),
      itemCount: AdsModel.items.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            image: DecorationImage(
              image: AssetImage(
                AdsModel.items[index].image,
              ),
              fit: BoxFit.cover
            ),
          ),
        );
      },
    );
  }
}
