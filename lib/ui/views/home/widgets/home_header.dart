import 'dart:async';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/common/ui_helpers.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  List featuredWidget =
      List.generate(5, (index) => 'https://picsum.photos/4${index}0/200');
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % 5;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: featuredWidget.asMap().entries.map((entry) {
          int idx = entry.key;
          String imgPath = entry.value;
          return AnimatedOpacity(
              opacity: _currentIndex == idx ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: ScreenTypeLayout.builder(
                desktop: (_) => _cardDesignDesktop(imgPath),
                mobile: (_) => _cardDesignMobile(imgPath),
              ));
        }).toList(),
      ),
    );
  }

  _cardDesignMobile(String data) {
    return Column(
      children: [
        //image
        _firstChild(data),

        //info
        _secondChild(data)
      ],
    );
  }

  _cardDesignDesktop(String data) {
    return Row(
      children: [
        Expanded(flex: 2, child: _firstChild(data)),
        Expanded(child: _secondChild(data))
      ],
    );
  }

  Widget _firstChild(String data) {
    return SizedBox(
      height: 400,
      width: double
          .infinity, // Add width if needed, for example double.infinity for full width
      child: Image.network(
        data,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child; // Image is fully loaded
          }
          return const Center(
            child: CircularProgressIndicator(
              color:
                  kcPrimaryColor, // Show progress indicator while image is loading
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) =>
            const SizedBox(), // Hide if there's an error
      ),
    );
  }

  Widget _secondChild(String data) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      height: 400,
      color: kcPrimaryColorDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //part 1
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured Causes",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: ktsBodyLarge.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (_currentIndex == 0) {
                                _currentIndex = featuredWidget.length - 1;
                              } else {
                                _currentIndex--;
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.white,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _currentIndex =
                                  (_currentIndex + 1) % featuredWidget.length;
                            });
                          },
                          icon: const Icon(Icons.keyboard_arrow_right,
                              color: Colors.white)),
                    ],
                  )
                ],
              ),
              const Divider(
                color: Colors.white,
                thickness: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(featuredWidget.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color:
                          _currentIndex == index ? Colors.amber : Colors.white,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ],
          ),
          verticalSpace(30),

          //part 2
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data,
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: ktsBodyLarge.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              verticalSpace(10),
              Text(
                faker.lorem.sentences(10).join(" "),
                maxLines: 8,
                overflow: TextOverflow.ellipsis,
                style: ktsBodyRegular.copyWith(color: Colors.white),
              ),
              verticalSpace(10),
              MaterialButton(
                onPressed: () {
                  // Add your onPressed code here
                },
                color: kcVeryLightGrey,
                textColor: kcPrimaryColorDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Adjust the corner radius here
                ),
                child: SizedBox(
                    width: double.infinity,
                    height: 25,
                    child: Text(
                      'DONATE',
                      textAlign: TextAlign.center,
                      style:
                          ktsBodyRegular.copyWith(fontWeight: FontWeight.w700),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
