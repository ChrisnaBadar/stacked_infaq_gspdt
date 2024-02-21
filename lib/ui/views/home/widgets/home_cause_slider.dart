import 'package:carousel_slider/carousel_slider.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/views/home/home_viewmodel.dart';
import 'package:infaq/ui/widgets/themed_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeCauseSlider extends StatefulWidget {
  final HomeViewModel viewModel;
  const HomeCauseSlider({super.key, required this.viewModel});

  @override
  State<HomeCauseSlider> createState() => _HomeCauseSliderState();
}

class _HomeCauseSliderState extends State<HomeCauseSlider> {
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
                "Causes List",
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
            viewModel: widget.viewModel,
          ),
        ],
      ),
    );
  }
}

class CauseListCarousel extends StatelessWidget {
  final CarouselController controller;
  final HomeViewModel viewModel;

  CauseListCarousel(
      {super.key, required this.controller, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final List<Widget> _items = [
      CauseItem(
        title: 'Send Food To Middle East',
        progress: 0.82,
        toGo: '\$21,444 To Go',
        imgLink: "https://picsum.photos/301/300",
        onTap: () => viewModel.toCauseDetailsView(causeId: '1'),
      ),
      CauseItem(
          title: 'Drought And Hunger',
          progress: 0.03,
          toGo: '\$96,312 To Go',
          imgLink: "https://picsum.photos/302/300",
          onTap: () => viewModel.toCauseDetailsView(causeId: '1')),
      CauseItem(
          title: 'More Plants Needed',
          progress: 0.73,
          toGo: '\$21,313 To Go',
          imgLink: "https://picsum.photos/303/300",
          onTap: () => viewModel.toCauseDetailsView(causeId: '1')),
      CauseItem(
          title: 'Please Help Refugees',
          progress: 0.85,
          toGo: '\$7,458 To Go',
          imgLink: "https://picsum.photos/304/300",
          onTap: () => viewModel.toCauseDetailsView(causeId: '1')),
      CauseItem(
          title: 'Please Help Refugees',
          progress: 0.85,
          toGo: '\$7,458 To Go',
          imgLink: "https://picsum.photos/305/300",
          onTap: () => viewModel.toCauseDetailsView(causeId: '1')),
      // Add more items if necessary
    ];
    return CarouselSlider(
      carouselController: controller, // Assign the controller here
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: false,
        viewportFraction:
            getValueForScreenType(context: context, mobile: 1, desktop: .2),
        aspectRatio:
            getValueForScreenType(context: context, mobile: 1, desktop: 3),
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
  final Function()? onTap;

  const CauseItem(
      {Key? key,
      required this.title,
      required this.progress,
      required this.toGo,
      required this.imgLink,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: ktsBodyLarge.copyWith()),
            Text(
              faker.lorem.sentences(5).join(" "),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: ktsBodyRegular,
            ),
            LinearProgressIndicator(value: progress),
            Text(toGo),
            ThemedButton(
              onPressed: () {},
              buttonText: "DONATE NOW",
              reverse: true,
            ),
          ],
        ),
      ),
    );
  }
}
