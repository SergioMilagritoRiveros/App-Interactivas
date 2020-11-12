import 'package:animapp/router.dart/route_names.dart';
import 'package:animapp/views/welcomePage.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName,
      {Map<String, String> queryParams}) {
    if (queryParams != null) {
      routeName = Uri(path: routeName, queryParameters: queryParams).toString();
    }

    return navigatorKey.currentState.pushNamed(routeName);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }
}

void toHomePage() {
  locator<NavigationService>().navigateTo(HomeRoute);
}

void toForumsPage() {
  locator<NavigationService>().navigateTo(ForumsRoute);
}

void toScheduledAppointmentPage() {
  locator<NavigationService>().navigateTo(ScheduledAppointmentRoute);
}

void toWelcomePage() {
  locator<NavigationService>().navigateTo(WelcomePageRoute);
}
