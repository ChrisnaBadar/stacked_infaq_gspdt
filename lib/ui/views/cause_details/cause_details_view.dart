import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'cause_details_view.desktop.dart';
import 'cause_details_view.tablet.dart';
import 'cause_details_view.mobile.dart';
import 'cause_details_viewmodel.dart';

class CauseDetailsView extends StackedView<CauseDetailsViewModel> {
  final String causeId;
  const CauseDetailsView({super.key, @pathParam required this.causeId});

  @override
  Widget builder(
    BuildContext context,
    CauseDetailsViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const CauseDetailsViewMobile(),
      tablet: (_) => const CauseDetailsViewTablet(),
      desktop: (_) => const CauseDetailsViewDesktop(),
    );
  }

  @override
  CauseDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CauseDetailsViewModel();
}
