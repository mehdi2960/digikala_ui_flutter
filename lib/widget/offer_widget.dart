import 'package:digikala_ui/models/offer_model.dart';
import 'package:digikala_ui/theme/app_colors.dart';
import 'package:digikala_ui/theme/app_spacings.dart';
import 'package:flutter/material.dart';

class Offer extends StatelessWidget {
  const Offer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height/1.99,
      padding: EdgeInsets.symmetric(vertical: AppSpacings.xl),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.lightRed,
            AppColors.mainRed,
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            OfferModel.items.length + 2,
            (index) {
              final offer = OfferModel.items[index < 3 ? index : index - 2];
              return index == 0
                  ? FirstOfferTitle(size: size)
                  : index == OfferModel.items.length+1
                      ? Container(
                          padding: EdgeInsets.all(AppSpacings.l),
                          margin: EdgeInsets.only(right: AppSpacings.m),
                          width: size.width / 2.8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_circle_left_outlined,size: 50,color: AppColors.mainRed,),
                              Text("مشاهده همه",style:TextStyle(color:Colors.black,fontSize: 17),),
                            ],
                          ),
                        )
                      : OfferTitle(offerModel: offer);
            },
          ),
        ),
      ),
    );
  }
}

class FirstOfferTitle extends StatelessWidget {
  const FirstOfferTitle({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacings.l),
      margin: EdgeInsets.only(right: AppSpacings.m),
      width: size.width / 2.8,
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        children: [
          Text(
            "پـیشنهاد\nشگفـت\nانگیـز",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          Image.asset("assets/images/box.png"),
        ],
      ),
    );
  }
}

class OfferTitle extends StatelessWidget {
  const OfferTitle({
    Key? key,
    required this.offerModel,
  }) : super(key: key);

  final OfferModel offerModel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(AppSpacings.l),
      margin: EdgeInsets.only(right: AppSpacings.m),
      width: size.width / 2.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "شگفت انگیز اختصاصی اپ",
            style: TextStyle(color: AppColors.mainRed, fontSize: 10),
          ),
          SizedBox(
            height: AppSpacings.m,
          ),
          Image.network(offerModel.image),
          SizedBox(
            height: AppSpacings.m,
          ),
          Text(
            offerModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          if (offerModel.isAvailabel)
            Row(
              children: [
                Icon(
                  Icons.check,
                  color: AppColors.blue,
                ),
                Text(
                  "موجود در انبار دیجی کالا",
                  style: TextStyle(fontSize: 9.0),
                ),
              ],
            )
          else
            Text(
              "تنها 2 عدد در انبار باقیست",
              style: TextStyle(fontSize: 12, color: AppColors.mainRed),
            ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 2.0),
                decoration: BoxDecoration(
                    color: AppColors.mainRed,
                    borderRadius: BorderRadius.circular(AppSpacings.xxl)),
                child: Text(
                  offerModel.discount,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Column(
                children: [
                  Text(offerModel.price),
                  Text(
                    offerModel.previousPrice,
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: AppColors.lightGrey200,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 5.0,
              ),
              Image.asset("assets/images/toman.png"),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "19:11:11",
            style: TextStyle(fontSize: 14, color: AppColors.lightGrey200),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
