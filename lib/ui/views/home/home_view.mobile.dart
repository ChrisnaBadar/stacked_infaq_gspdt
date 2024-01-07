import 'package:flutter/material.dart';
import 'package:infaq/ui/views/home/widgets/home_cause_slider.dart';
import 'package:infaq/ui/views/home/widgets/home_fourth_section.dart';
import 'package:infaq/ui/views/home/widgets/home_header.dart';
import 'package:infaq/ui/views/home/widgets/home_second_section.dart';
import 'package:infaq/ui/views/home/widgets/home_third_section.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      body: ListView(
        children: [
          HomeHeader(
            viewModel: viewModel,
            fundraisesListModel: null,
          ),
          HomeSecondSection(),
          HomeCauseSlider(
            viewModel: viewModel,
          ),
          HomeThirdSection(),
          HomeFourthSection()
        ],
      ),
    );
  }
}
