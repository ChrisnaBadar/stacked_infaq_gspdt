import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'terms_conditions_view.desktop.dart';
import 'terms_conditions_view.tablet.dart';
import 'terms_conditions_view.mobile.dart';
import 'terms_conditions_viewmodel.dart';

class TermsConditionsView extends StackedView<TermsConditionsViewModel> {
  const TermsConditionsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    TermsConditionsViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const TermsConditionsViewMobile(),
      tablet: (_) => const TermsConditionsViewTablet(),
      desktop: (_) => const TermsConditionsViewDesktop(),
    );
  }

  @override
  TermsConditionsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TermsConditionsViewModel();
}
