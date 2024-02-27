import 'dart:async';
import 'package:flutter/material.dart';
import 'package:infaq/models/fundraises_list_model.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/common/ui_helpers.dart';
import 'package:infaq/ui/views/home/home_viewmodel.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeHeader extends StatefulWidget {
  final HomeViewModel viewModel;
  final FundraisesListModel? fundraisesListModel;
  const HomeHeader(
      {super.key, required this.viewModel, required this.fundraisesListModel});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
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
    List<FundraisesListModelDatum> featuredData = widget
        .fundraisesListModel!.data!
        .where((e) => e.attributes!.featuredCause == true)
        .toList();
    List dataList = List.generate(featuredData.length, (index) {
      var fundraiser = featuredData[index];
      return {
        "id": fundraiser.id,
        "img":
            "https://api.amala-api.online${fundraiser.attributes!.mainImage!.data!.attributes!.url!}",
        "title":
            fundraiser.attributes!.title!, // Assuming title is available here
        "description": fundraiser.attributes!.description!.first.children!.first
            .text, // Assuming description is available here
        "causeId": fundraiser.id.toString()
      };
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: ScreenTypeLayout.builder(
            desktop: (_) =>
                _cardDesignDesktop(dataList: dataList[_currentIndex]),
            mobile: (_) => _cardDesignMobile(dataList: dataList[_currentIndex]),
          ),
        ),
      ),
    );
  }

  // ContainerWidget(
  // key: ValueKey<int>(_currentIndex),
  // data: myList[_currentIndex],
  // )

  _cardDesignMobile({required Map<String, dynamic> dataList}) {
    return Column(
      children: [
        //image
        _firstChild(dataList['img']),

        //info
        _secondChild(widget.viewModel, dataList['id'], dataList['title'],
            dataList['description'], dataList['causeId'])
      ],
    );
  }

  _cardDesignDesktop({required Map<String, dynamic> dataList}) {
    return Row(
      children: [
        Expanded(flex: 2, child: _firstChild(dataList['img'])),
        Expanded(
            child: _secondChild(
                widget.viewModel,
                dataList['id'],
                dataList['title'],
                dataList['description'],
                dataList['causeId']))
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

  Widget _secondChild(HomeViewModel viewModel, int id, String title,
      String description, String causeId) {
    // print(title);
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
                                _currentIndex = 5 - 1;
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
                              _currentIndex = (_currentIndex + 1) % 5;
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
                children: List.generate(5, (index) {
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
                title,
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: ktsBodyLarge.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              verticalSpace(10),
              Text(
                description,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: ktsBodyRegular.copyWith(color: Colors.white),
              ),
              verticalSpace(10),
              TextButton(
                  onPressed: () {
                    viewModel.toCauseDetailsView(causeId: causeId);
                  },
                  child: Text("Learn more ...")),
              verticalSpace(10),
              MaterialButton(
                onPressed: () {
                  // Add your onPressed code here
                  viewModel.showDonateDialog(
                      id: id, causeTitle: title, description: description);
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
                      'INFAQ',
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
