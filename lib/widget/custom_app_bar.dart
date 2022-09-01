import 'package:digikala_ui/utils/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacings.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white60,
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacings.m),
          color: AppColors.lightGrey100
        ),
        child: Row(children: [
          Icon(Icons.search,color:AppColors.darkGrey200),
          SizedBox(width: AppSpacings.l,),
          Text("جستجو در",style: TextStyle(color: AppColors.darkGrey100,fontSize: 17.0),),
          SizedBox(width: AppSpacings.s,),
          SvgPicture.network('https://www.digikala.com/statics/img/svg/digi.svg',width: 60,)

        ],),
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(56.0);
}