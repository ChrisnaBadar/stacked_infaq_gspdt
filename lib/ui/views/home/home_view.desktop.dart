import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_constants.dart';
import 'package:infaq/ui/common/ui_helpers.dart';
import 'package:infaq/ui/views/home/widgets/home_header.dart';
import 'package:infaq/ui/views/home/widgets/home_second_section.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SizedBox(
      width: kdDesktopMaxContentWidth * .5,
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            HomeHeader(),
            verticalSpace(20),
            HomeSecondSection(),

            //
          ],
        ),
      ),
    );
  }
}
