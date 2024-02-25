import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:infaq/models/articles_model.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/common/ui_helpers.dart';
import 'package:infaq/ui/views/home/home_viewmodel.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FsArticles extends StatefulWidget {
  final HomeViewModel viewModel;
  final ArticlesModel articlesModel;
  const FsArticles(
      {super.key, required this.viewModel, required this.articlesModel});

  @override
  State<FsArticles> createState() => _FsArticlesState();
}

class _FsArticlesState extends State<FsArticles> {
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
            viewModel: widget.viewModel,
            articlesModel: widget.articlesModel,
          ),
        ],
      ),
    );
  }
}

class CauseListCarousel extends StatelessWidget {
  final CarouselController controller;
  final HomeViewModel viewModel;
  final ArticlesModel articlesModel;

  const CauseListCarousel(
      {super.key,
      required this.controller,
      required this.viewModel,
      required this.articlesModel});

  @override
  Widget build(BuildContext context) {
    final List<Widget> _items = List.generate(
        3,
        (index) => ArticleItem(
            title: articlesModel.data![index].attributes!.articleTitle!,
            imgLink: articlesModel.data![index].attributes!.landscapeImageLink!,
            viewModel: viewModel));
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

class ArticleItem extends StatelessWidget {
  final String title;
  final String imgLink;
  final HomeViewModel viewModel;

  const ArticleItem(
      {Key? key,
      required this.title,
      required this.imgLink,
      required this.viewModel})
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
