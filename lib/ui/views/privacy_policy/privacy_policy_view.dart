import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'privacy_policy_view.desktop.dart';
import 'privacy_policy_view.tablet.dart';
import 'privacy_policy_view.mobile.dart';
import 'privacy_policy_viewmodel.dart';

class PrivacyPolicyView extends StackedView<PrivacyPolicyViewModel> {
  const PrivacyPolicyView({super.key});

  @override
  Widget builder(
    BuildContext context,
    PrivacyPolicyViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const PrivacyPolicyViewMobile(),
      tablet: (_) => const PrivacyPolicyViewTablet(),
      desktop: (_) => const PrivacyPolicyViewDesktop(),
    );
  }

  @override
  PrivacyPolicyViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PrivacyPolicyViewModel();
}
