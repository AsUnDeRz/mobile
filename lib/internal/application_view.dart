import 'package:catalog_app/domain/model/theme_mode_application.dart';

abstract class ApplicationView {
  void onUpdate(ThemeModeApplication themeMode);
}