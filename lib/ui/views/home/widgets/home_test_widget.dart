import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_constants.dart';

class HomeTestWidget extends StatefulWidget {
  const HomeTestWidget({super.key});

  @override
  State<HomeTestWidget> createState() => _HomeTestWidgetState();
}

class _HomeTestWidgetState extends State<HomeTestWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.5);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: kdDesktopMaxContentWidth,
      height: 400,
      child: PageView.builder(
        controller: _pageController,
        itemCount: 10, // Number of items in your carousel
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              'Item $index',
              style: TextStyle(fontSize: 32),
            ),
            color: index % 2 == 0 ? Colors.blue : Colors.green,
          );
        },
      ),
    );
  }
}
