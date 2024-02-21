import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'routing_test_view.desktop.dart';
import 'routing_test_view.tablet.dart';
import 'routing_test_view.mobile.dart';
import 'routing_test_viewmodel.dart';

class RoutingTestView extends StackedView<RoutingTestViewModel> {
  const RoutingTestView({super.key});

  @override
  Widget builder(
    BuildContext context,
    RoutingTestViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const RoutingTestViewMobile(),
      tablet: (_) => const RoutingTestViewTablet(),
      desktop: (_) => const RoutingTestViewDesktop(),
    );
  }

  @override
  RoutingTestViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RoutingTestViewModel();
}
