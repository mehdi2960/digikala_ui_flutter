import 'package:digikala_ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../models/digi_apps_model.dart';

class DigiGridView extends StatelessWidget {
  const DigiGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemCount: DigiAppsModel.items.length + 1,
      itemBuilder: (BuildContext context, int index) {
        final app = DigiAppsModel.items[index == 0 ? 0 : index - 1];
        return index == DigiAppsModel.items.length
            ? Column(
                children: [
                  Container(
                    width: 70,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.more_horiz,
                      color: AppColors.darkGrey100,
                    ),
                  ),
                  Text(app.title),
                ],
              )
            : Logo(app: app);
      },
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    required this.app,
  }) : super(key: key);

  final DigiAppsModel app;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          app.image,
          width: 50,
          height: 50,
        ),
        Text(app.title),
      ],
    );
  }
}
