import 'package:catalog_app/domain/interactor/get_theme_mode_application_case.dart';
import 'package:catalog_app/domain/interactor/set_theme_mode_application_case.dart';
import 'package:catalog_app/domain/interactor/get_theme_mode_application_stream_case.dart';

import 'theme_mode_application_repository_module.dart';

class ThemeModeApplicationModule {

  static final getThemeModeApplicationStreamCase = GetThemeModeApplicationStreamCase(
      ThemeModeApplicationRepositoryModule.themeModeApplicationRepository
  );
  static final getThemeModeApplicationCase = GetThemeModeApplicationCase(
      ThemeModeApplicationRepositoryModule.themeModeApplicationRepository
  );
  static final setThemeModeApplicationCase = SetThemeModeApplicationCase(
      ThemeModeApplicationRepositoryModule.themeModeApplicationRepository
  );
}