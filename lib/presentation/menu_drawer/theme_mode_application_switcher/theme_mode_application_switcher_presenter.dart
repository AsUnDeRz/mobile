import 'dart:async';

import 'package:catalog_app/domain/model/theme_mode_application.dart';
import 'package:catalog_app/internal/dependencies/theme_mode_application_module.dart';

import 'theme_mode_application_switcher_view.dart';


class ThemeModeApplicationSwitcherPresenter  {

  final _getThemeModeApplicationStreamCase = ThemeModeApplicationModule.getThemeModeApplicationStreamCase;
  final _setThemeModeApplicationCase = ThemeModeApplicationModule.setThemeModeApplicationCase;
  StreamSubscription<ThemeModeApplication> _themeModeSubscription;
  final ThemeModeApplicationSwitcherView _view;

  ThemeModeApplicationSwitcherPresenter(this._view);

  void changeThemeModeApplication(bool themeMode){
    _setThemeModeApplicationCase.setThemeModeApplication(themeMode);
  }

  void startThemeModeApplicationStream() {
    _themeModeSubscription = _getThemeModeApplicationStreamCase.getThemeModeApplicationStream()
        .listen(_view.onUpdate);
  }

  void stopThemeModeApplicationStream() {
    if (_themeModeSubscription != null) {
      _themeModeSubscription.cancel();
      _themeModeSubscription = null;
    }
  }
}