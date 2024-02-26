import 'package:flutter/material.dart';
import 'package:infaq/ui/views/privacy_policy/privacy_policy_text_widget.dart';
import 'package:stacked/stacked.dart';

import 'privacy_policy_viewmodel.dart';

class PrivacyPolicyViewDesktop extends ViewModelWidget<PrivacyPolicyViewModel> {
  const PrivacyPolicyViewDesktop({super.key});

  @override
  Widget build(BuildContext context, PrivacyPolicyViewModel viewModel) {
    return const Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.all(20), child: PrivacyPolicyTextWidget()));
  }
}
