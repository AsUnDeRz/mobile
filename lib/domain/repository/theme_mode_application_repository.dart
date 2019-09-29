import 'package:catalog_app/domain/model/theme_mode_application.dart';

abstract class ThemeModeApplicationRepository {
  Future<ThemeModeApplication> getThemeModeApplication();
  Future<void> setThemeModeApplication(bool themeMode);
  Stream<ThemeModeApplication> getThemeModeApplicationStream();
}

