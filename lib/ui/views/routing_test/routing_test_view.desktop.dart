import 'package:flutter/material.dart';
import 'package:infaq/ui/views/routing_test/routing_test_body.dart';
import 'package:stacked/stacked.dart';

import 'routing_test_viewmodel.dart';

class RoutingTestViewDesktop extends ViewModelWidget<RoutingTestViewModel> {
  const RoutingTestViewDesktop({super.key});

  @override
  Widget build(BuildContext context, RoutingTestViewModel viewModel) {
    return Scaffold(
      body: RoutingTestBody(),
    );
  }
}
