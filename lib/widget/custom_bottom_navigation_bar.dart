import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {Key? key, required this.onTap, required this.curentIndex})
      : super(key: key);

  final int curentIndex;
  final Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: curentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: "خانه",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined),
          activeIcon: Icon(Icons.category),
          label: "دسته بندی ها",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          activeIcon: Icon(Icons.shopping_cart),
          label: "سبد خرید",
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.googlePay,
            size: 25,
          ),
          label: "مگند",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.usb_rounded),
          label: "دیجی کالای من",
        ),
      ],
    );
  }
}
