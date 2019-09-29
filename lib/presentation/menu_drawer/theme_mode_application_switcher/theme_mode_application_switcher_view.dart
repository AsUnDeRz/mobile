import 'package:catalog_app/domain/model/theme_mode_application.dart';

abstract class ThemeModeApplicationSwitcherView  {
  void onUpdate(ThemeModeApplication themeModeApplication);
  void onChange(bool themeMode);
}