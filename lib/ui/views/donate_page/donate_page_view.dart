import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'donate_page_view.desktop.dart';
import 'donate_page_view.tablet.dart';
import 'donate_page_view.mobile.dart';
import 'donate_page_viewmodel.dart';

class DonatePageView extends StackedView<DonatePageViewModel> {
  final String causeId;
  const DonatePageView({super.key, @pathParam required this.causeId});

  @override
  Widget builder(
    BuildContext context,
    DonatePageViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const DonatePageViewMobile(),
      tablet: (_) => const DonatePageViewTablet(),
      desktop: (_) => const DonatePageViewDesktop(),
    );
  }

  @override
  DonatePageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DonatePageViewModel();
}
