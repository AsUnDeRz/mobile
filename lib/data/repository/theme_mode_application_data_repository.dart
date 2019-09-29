import 'package:catalog_app/data/sp/sp_util.dart';
import 'package:rxdart/rxdart.dart';

import 'package:catalog_app/domain/model/theme_mode_application.dart';
import 'package:catalog_app/domain/repository/theme_mode_application_repository.dart';

class ThemeModeApplicationDataRepository extends ThemeModeApplicationRepository {

  final SpUtil _spUtil;
  final _themeModeSubject = BehaviorSubject <ThemeModeApplication> ();

  ThemeModeApplicationDataRepository (this._spUtil) {
    _themeModeUpdate();
  }

  @override
  Future<void> setThemeModeApplication(bool theme) async {
    await _spUtil.setThemeModeApplication(theme);
    await _themeModeUpdate();
  }

  @override
  Future<ThemeModeApplication> getThemeModeApplication() async {
    final themeMode = await _spUtil.getThemeModeApplication();
    return ThemeModeApplication(themeMode);
  }

  @override
  Stream<ThemeModeApplication> getThemeModeApplicationStream() {
    return _themeModeSubject.stream;
  }

  Future<void> _themeModeUpdate() async {
    final themeMode = await _spUtil.getThemeModeApplication();
    final theme = ThemeModeApplication(themeMode);
    _themeModeSubject.add(theme);
  }
}