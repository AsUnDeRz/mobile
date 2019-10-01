import 'package:rxdart/rxdart.dart';

import 'package:catalog_app/domain/model/application_theme.dart';
import 'package:catalog_app/domain/repository/application_theme_repository.dart';
import 'package:catalog_app/data/sp/sp_util.dart';

class ApplicationThemeDataRepository extends ApplicationThemeRepository {
  final SpUtil _spUtil;
  final _themeModeSubject = BehaviorSubject <ApplicationTheme> ();

  ApplicationThemeDataRepository (this._spUtil) {
    _themeModeUpdate();
  }

  @override
  Future<void> setApplicationTheme(bool theme) async {
    await _spUtil.setApplicationTheme(theme);
    await _themeModeUpdate();
  }

  @override
  Future<ApplicationTheme> getApplicationTheme() async {
    final themeMode = await _spUtil.getApplicationTheme();
    return ApplicationTheme(themeMode);
  }

  @override
  Stream<ApplicationTheme> getApplicationThemeStream() {
    return _themeModeSubject.stream;
  }

  Future<void> _themeModeUpdate() async {
    final themeMode = await _spUtil.getApplicationTheme();
    final theme = ApplicationTheme(themeMode);
    _themeModeSubject.add(theme);
  }
}