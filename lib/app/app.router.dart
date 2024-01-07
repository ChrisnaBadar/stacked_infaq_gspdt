// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i8;
import 'package:stacked/stacked.dart' as _i7;
import 'package:stacked_services/stacked_services.dart' as _i6;

import '../ui/views/cause_details/cause_details_view.dart' as _i4;
import '../ui/views/donate_page/donate_page_view.dart' as _i5;
import '../ui/views/home/home_view.dart' as _i3;
import '../ui/views/main_layout/main_layout_view.dart' as _i1;
import '../ui/views/unknown/unknown_view.dart' as _i2;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i6.StackedService.navigatorKey);

class StackedRouterWeb extends _i7.RootStackRouter {
  StackedRouterWeb({_i8.GlobalKey<_i8.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    MainLayoutViewRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.MainLayoutView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.UnknownView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CauseDetailsViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CauseDetailsViewArgs>(
          orElse: () =>
              CauseDetailsViewArgs(causeId: pathParams.getString('causeId')));
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.CauseDetailsView(
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
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.DonatePageView(
          key: args.key,
          causeId: args.causeId,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          MainLayoutViewRoute.name,
          path: '/',
          children: [
            _i7.RouteConfig(
              HomeViewRoute.name,
              path: '',
              parent: MainLayoutViewRoute.name,
            ),
            _i7.RouteConfig(
              CauseDetailsViewRoute.name,
              path: 'cause-details/:causeId',
              parent: MainLayoutViewRoute.name,
            ),
            _i7.RouteConfig(
              DonatePageViewRoute.name,
              path: 'donate-page/:causeId',
              parent: MainLayoutViewRoute.name,
            ),
          ],
        ),
        _i7.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i7.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.MainLayoutView]
class MainLayoutViewRoute extends _i7.PageRouteInfo<void> {
  const MainLayoutViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainLayoutViewRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainLayoutView';
}

/// generated route for
/// [_i2.UnknownView]
class UnknownViewRoute extends _i7.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

/// generated route for
/// [_i3.HomeView]
class HomeViewRoute extends _i7.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i4.CauseDetailsView]
class CauseDetailsViewRoute extends _i7.PageRouteInfo<CauseDetailsViewArgs> {
  CauseDetailsViewRoute({
    _i8.Key? key,
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

  final _i8.Key? key;

  final String causeId;

  @override
  String toString() {
    return 'CauseDetailsViewArgs{key: $key, causeId: $causeId}';
  }
}

/// generated route for
/// [_i5.DonatePageView]
class DonatePageViewRoute extends _i7.PageRouteInfo<DonatePageViewArgs> {
  DonatePageViewRoute({
    _i8.Key? key,
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

  final _i8.Key? key;

  final String causeId;

  @override
  String toString() {
    return 'DonatePageViewArgs{key: $key, causeId: $causeId}';
  }
}

extension RouterStateExtension on _i6.RouterService {
  Future<dynamic> navigateToMainLayoutView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const MainLayoutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCauseDetailsView({
    _i8.Key? key,
    required String causeId,
    void Function(_i7.NavigationFailure)? onFailure,
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
    _i8.Key? key,
    required String causeId,
    void Function(_i7.NavigationFailure)? onFailure,
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
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const MainLayoutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCauseDetailsView({
    _i8.Key? key,
    required String causeId,
    void Function(_i7.NavigationFailure)? onFailure,
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
    _i8.Key? key,
    required String causeId,
    void Function(_i7.NavigationFailure)? onFailure,
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
