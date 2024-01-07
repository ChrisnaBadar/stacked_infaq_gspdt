import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/common/ui_helpers.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CauseDetailsArticles extends StatefulWidget {
  const CauseDetailsArticles({super.key});

  @override
  State<CauseDetailsArticles> createState() => _CauseDetailsArticlesState();
}

class _CauseDetailsArticlesState extends State<CauseDetailsArticles> {
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Articles List",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: ktsBodyLarge.copyWith(
                    fontSize: 15, fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        _controller.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      },
                      icon: const Icon(Icons.keyboard_arrow_right)),
                ],
              )
            ],
          ),
          const Divider(
            thickness: 3,
          ),
          CauseListCarousel(
            controller: _controller,
          ),
        ],
      ),
    );
  }
}

class CauseListCarousel extends StatelessWidget {
  final CarouselController controller;
  final List<Widget> _items = [
    const CauseItem(
        title: 'Send Food To Middle East',
        progress: 0.82,
        toGo: '\$21,444 To Go',
        imgLink: "https://picsum.photos/410/200"),
    const CauseItem(
        title: 'Drought And Hunger',
        progress: 0.03,
        toGo: '\$96,312 To Go',
        imgLink: "https://picsum.photos/420/200"),
    const CauseItem(
        title: 'More Plants Needed',
        progress: 0.73,
        toGo: '\$21,313 To Go',
        imgLink: "https://picsum.photos/430/200"),
    const CauseItem(
        title: 'Please Help Refugees',
        progress: 0.85,
        toGo: '\$7,458 To Go',
        imgLink: "https://picsum.photos/440/200"),
    const CauseItem(
        title: 'Please Help Refugees',
        progress: 0.85,
        toGo: '\$7,458 To Go',
        imgLink: "https://picsum.photos/450/200"),
    // Add more items if necessary
  ];

  CauseListCarousel({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: controller, // Assign the controller here
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: false,
        viewportFraction:
            getValueForScreenType(context: context, mobile: 1, desktop: .35),
        aspectRatio:
            getValueForScreenType(context: context, mobile: 1, desktop: 2),
        initialPage: 1,
        autoPlayInterval: const Duration(seconds: 5),
        enableInfiniteScroll: true,
        scrollPhysics: const PageScrollPhysics(), // to enable snapping
      ),
      items: _items
          .map((item) => Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: getValueForScreenType(
                        context: context,
                        mobile: MediaQuery.of(context).size.width * 0.9,
                        desktop: MediaQuery.of(context).size.width * 0.25),
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: item,
                  );
                },
              ))
          .toList(),
    );
  }
}

class CauseItem extends StatelessWidget {
  final String title;
  final double progress;
  final String toGo;
  final String imgLink;

  const CauseItem(
      {Key? key,
      required this.title,
      required this.progress,
      required this.toGo,
      required this.imgLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            // Image or content goes here
            child: Image.network(
              imgLink,
              fit: BoxFit.cover,
            ),
          ),
          Text(title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: ktsBodyLarge.copyWith()),
          verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.av_timer_outlined),
                  Text(
                    "01 Des 23",
                    style: ktsBodyRegular.copyWith(
                        fontSize: 12, color: kcMediumGrey),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.person_4_outlined),
                  Text(
                    "John Doe",
                    style: ktsBodyRegular.copyWith(
                        fontSize: 12, color: kcMediumGrey),
                  )
                ],
              ),
            ],
          ),
          verticalSpace(10),
          Text(
            faker.lorem.sentences(5).join(" "),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: ktsBodyRegular.copyWith(color: kcMediumGrey),
          ),
          TextButton(onPressed: () {}, child: Text("Read More.."))
        ],
      ),
    );
  }
}
