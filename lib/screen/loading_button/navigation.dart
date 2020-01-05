import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'loading_button.dart';
import 'page_two.dart';

class Navigation {
  static Router router;

  static void initPaths() {
    router = Router()
      ..define('/', handler: Handler(
          handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        return LoadingButton(title: 'Progress Button');
      }))
      ..define('page_two', handler: Handler(
          handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        return PageTwo(title: 'Second Page');
      }));
  }

  static void navigateTo(
    BuildContext context,
    String path, {
    bool replace = false,
    TransitionType transition = TransitionType.native,
    Duration transitionDuration = const Duration(milliseconds: 250),
    RouteTransitionsBuilder transitionBuilder,
  }) {
    router.navigateTo(
      context,
      path,
      replace: replace,
      transition: transition,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder,
    );
  }
}
