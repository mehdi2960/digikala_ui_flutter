import 'package:flutter/material.dart';
import '../widget/custom_bottom_navigation_bar.dart';
import 'home_scrren.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomeScreen(),
          Scaffold(),
          Scaffold(),
          Scaffold(),
          Scaffold(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        curentIndex: currentIndex,
        onTap: (int index) {
          setState(
            () {
              currentIndex= index;
            },
          );
        },
      ),
    );
  }
}
