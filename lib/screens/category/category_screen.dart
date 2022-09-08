import 'package:digikala_ui/models/category_model.dart';
import 'package:digikala_ui/screens/category/widgets/popular_brand_widget.dart';
import 'package:digikala_ui/theme/app_colors.dart';
import 'package:digikala_ui/theme/app_spacings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../widget/custom_app_bar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: CategoryModel.items
                  .map((category) => CategoryTitle(category: category))
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            const PopularBrandWidget(),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(AppSpacings.xl),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        const Text(
                          " .سفارش شما به <اهواز>ارسال میشود.امکان خرید هزینه،و شیوه ارسال کالاها بر این اساس مساحبه میشود",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: AppSpacings.l,),
                        Row(
                          children: [
                            Text("تغییر در محل",style: TextStyle(color: Colors.blue[300],),),
                            Icon(Icons.keyboard_arrow_left,color: Colors.blue[200]),
                          ],
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://dkstatics-public.digikala.com/digikala-adservice-banners/4c4a8531ee9aa2cf3814770cdd70faf63ee7b95f_1662375693.gif?x-oss-process=image',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacings.xl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(category.title),
                IconButton(
                  onPressed: () {},
                  icon: const Text(
                    "مشاهده همه",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacings.m, vertical: AppSpacings.l),
            child: Row(
              children: category.subCategories
                  .map((subCategory) => subCategoryTitke(
                        subCategory: subCategory,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class subCategoryTitke extends StatelessWidget {
  const subCategoryTitke({Key? key, required this.subCategory})
      : super(key: key);

  final SubCategory subCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      padding: const EdgeInsets.all(
        AppSpacings.m,
      ),
      margin: const EdgeInsets.symmetric(horizontal: AppSpacings.s),
      decoration: BoxDecoration(
        color: AppColors.lightGrey100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.network(
            subCategory.image,
            width: 70,
            height: 70,
          ),
          const SizedBox(
            height: AppSpacings.l,
          ),
          Text(
            subCategory.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
          ),
          const SizedBox(
            height: AppSpacings.l,
          ),
          Text(subCategory.count)
        ],
      ),
    );
  }
}
