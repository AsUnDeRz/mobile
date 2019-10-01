import 'package:catalog_app/domain/model/application_theme.dart';

abstract class ApplicationThemeRepository {
  Future<ApplicationTheme> getApplicationTheme();
  Future<void> setApplicationTheme(bool themeMode);
  Stream<ApplicationTheme> getApplicationThemeStream();
}

