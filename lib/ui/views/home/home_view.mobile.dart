import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:infaq/ui/views/home/widgets/home_header.dart';
import 'package:infaq/ui/views/home/widgets/home_second_section.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      body: ListView(
        children: [HomeHeader(), HomeSecondSection()],
      ),
    );
  }
}
