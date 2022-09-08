import 'package:digikala_ui/models/category_model.dart';
import 'package:digikala_ui/theme/app_colors.dart';
import 'package:digikala_ui/theme/app_spacings.dart';
import 'package:flutter/material.dart';

class PopularBrandWidget extends StatefulWidget {
  const PopularBrandWidget({Key? key}) : super(key: key);

  @override
  State<PopularBrandWidget> createState() => _PopularBrandWidgetState();
}

class _PopularBrandWidgetState extends State<PopularBrandWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacings.xl),
            child: Text(
              "محبوب ترین برند ها",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 12,
          ),

          //Namayesh list mahbobha
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                CategoryModel.items.length,
                (index) {
                  final category = CategoryModel.items[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.fromLTRB(8, 8, 10, 12),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: selectedIndex == index
                                ? AppColors.mainRed
                                : AppColors.lightGrey100),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Text(
                        category.title,
                        style: TextStyle(
                          color: selectedIndex == index
                              ? AppColors.mainRed
                              : AppColors.darkGrey200,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        // Namayesh-Content-List
          Container(
            color: AppColors.lightGrey100,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  CategoryModel.items[selectedIndex].popularBrands.length,
              itemBuilder: (BuildContext context, int index) {
                final app =
                    CategoryModel.items[selectedIndex].popularBrands[index];
                return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(AppSpacings.xl),
                  child: Image.network(
                    app,
                    width: 50,
                    height: 50,
                  ),
                );
              },
            ),
          ),     
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
