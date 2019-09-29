import 'dart:async';

import 'package:catalog_app/domain/model/theme_mode_application.dart';
import 'package:catalog_app/internal/application_view.dart';
import 'package:catalog_app/internal/dependencies/theme_mode_application_module.dart';

class ApplicationPresenter  {

  final  _getThemeModeApplicationStreamCase = ThemeModeApplicationModule.getThemeModeApplicationStreamCase;
  StreamSubscription<ThemeModeApplication> _themeModeSubscription;
  final ApplicationView _view;

  ApplicationPresenter(this._view);

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