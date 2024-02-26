// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i10;
import 'package:stacked/stacked.dart' as _i9;
import 'package:stacked_services/stacked_services.dart' as _i8;

import '../ui/views/cause_details/cause_details_view.dart' as _i6;
import '../ui/views/donate_page/donate_page_view.dart' as _i7;
import '../ui/views/home/home_view.dart' as _i3;
import '../ui/views/main_layout/main_layout_view.dart' as _i1;
import '../ui/views/privacy_policy/privacy_policy_view.dart' as _i5;
import '../ui/views/routing_test/routing_test_view.dart' as _i4;
import '../ui/views/unknown/unknown_view.dart' as _i2;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i8.StackedService.navigatorKey);

class StackedRouterWeb extends _i9.RootStackRouter {
  StackedRouterWeb({_i10.GlobalKey<_i10.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    MainLayoutViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.MainLayoutView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.UnknownView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    RoutingTestViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.RoutingTestView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    PrivacyPolicyViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.PrivacyPolicyView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CauseDetailsViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CauseDetailsViewArgs>(
          orElse: () =>
              CauseDetailsViewArgs(causeId: pathParams.getString('causeId')));
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.CauseDetailsView(
          key: args.key,
          causeId: args.causeId,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    DonatePageViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DonatePageViewArgs>(
          orElse: () =>
              DonatePageViewArgs(causeId: pathParams.getString('causeId')));
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.DonatePageView(
          key: args.key,
          causeId: args.causeId,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          MainLayoutViewRoute.name,
          path: '/',
          children: [
            _i9.RouteConfig(
              HomeViewRoute.name,
              path: '',
              parent: MainLayoutViewRoute.name,
            ),
            _i9.RouteConfig(
              RoutingTestViewRoute.name,
              path: 'routing-test',
              parent: MainLayoutViewRoute.name,
            ),
            _i9.RouteConfig(
              PrivacyPolicyViewRoute.name,
              path: 'kebijakan-privasi',
              parent: MainLayoutViewRoute.name,
            ),
            _i9.RouteConfig(
              CauseDetailsViewRoute.name,
              path: 'cause-details/:causeId',
              parent: MainLayoutViewRoute.name,
            ),
            _i9.RouteConfig(
              DonatePageViewRoute.name,
              path: 'donate-page/:causeId',
              parent: MainLayoutViewRoute.name,
            ),
          ],
        ),
        _i9.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i9.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.MainLayoutView]
class MainLayoutViewRoute extends _i9.PageRouteInfo<void> {
  const MainLayoutViewRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MainLayoutViewRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainLayoutView';
}

/// generated route for
/// [_i2.UnknownView]
class UnknownViewRoute extends _i9.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

/// generated route for
/// [_i3.HomeView]
class HomeViewRoute extends _i9.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i4.RoutingTestView]
class RoutingTestViewRoute extends _i9.PageRouteInfo<void> {
  const RoutingTestViewRoute()
      : super(
          RoutingTestViewRoute.name,
          path: 'routing-test',
        );

  static const String name = 'RoutingTestView';
}

/// generated route for
/// [_i5.PrivacyPolicyView]
class PrivacyPolicyViewRoute extends _i9.PageRouteInfo<void> {
  const PrivacyPolicyViewRoute()
      : super(
          PrivacyPolicyViewRoute.name,
          path: 'kebijakan-privasi',
        );

  static const String name = 'PrivacyPolicyView';
}

/// generated route for
/// [_i6.CauseDetailsView]
class CauseDetailsViewRoute extends _i9.PageRouteInfo<CauseDetailsViewArgs> {
  CauseDetailsViewRoute({
    _i10.Key? key,
    required String causeId,
  }) : super(
          CauseDetailsViewRoute.name,
          path: 'cause-details/:causeId',
          args: CauseDetailsViewArgs(
            key: key,
            causeId: causeId,
          ),
          rawPathParams: {'causeId': causeId},
        );

  static const String name = 'CauseDetailsView';
}

class CauseDetailsViewArgs {
  const CauseDetailsViewArgs({
    this.key,
    required this.causeId,
  });

  final _i10.Key? key;

  final String causeId;

  @override
  String toString() {
    return 'CauseDetailsViewArgs{key: $key, causeId: $causeId}';
  }
}

/// generated route for
/// [_i7.DonatePageView]
class DonatePageViewRoute extends _i9.PageRouteInfo<DonatePageViewArgs> {
  DonatePageViewRoute({
    _i10.Key? key,
    required String causeId,
  }) : super(
          DonatePageViewRoute.name,
          path: 'donate-page/:causeId',
          args: DonatePageViewArgs(
            key: key,
            causeId: causeId,
          ),
          rawPathParams: {'causeId': causeId},
        );

  static const String name = 'DonatePageView';
}

class DonatePageViewArgs {
  const DonatePageViewArgs({
    this.key,
    required this.causeId,
  });

  final _i10.Key? key;

  final String causeId;

  @override
  String toString() {
    return 'DonatePageViewArgs{key: $key, causeId: $causeId}';
  }
}

extension RouterStateExtension on _i8.RouterService {
  Future<dynamic> navigateToMainLayoutView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const MainLayoutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToRoutingTestView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const RoutingTestViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToPrivacyPolicyView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const PrivacyPolicyViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCauseDetailsView({
    _i10.Key? key,
    required String causeId,
    void Function(_i9.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      CauseDetailsViewRoute(
        key: key,
        causeId: causeId,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToDonatePageView({
    _i10.Key? key,
    required String causeId,
    void Function(_i9.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      DonatePageViewRoute(
        key: key,
        causeId: causeId,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithMainLayoutView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const MainLayoutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithRoutingTestView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const RoutingTestViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithPrivacyPolicyView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const PrivacyPolicyViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCauseDetailsView({
    _i10.Key? key,
    required String causeId,
    void Function(_i9.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      CauseDetailsViewRoute(
        key: key,
        causeId: causeId,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithDonatePageView({
    _i10.Key? key,
    required String causeId,
    void Function(_i9.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      DonatePageViewRoute(
        key: key,
        causeId: causeId,
      ),
      onFailure: onFailure,
    );
  }
}
