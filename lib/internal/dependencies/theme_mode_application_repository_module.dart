import 'package:catalog_app/data/repository/theme_mode_application_data_repository.dart';

import 'sp_module.dart';

class ThemeModeApplicationRepositoryModule {
  static final themeModeApplicationRepository = ThemeModeApplicationDataRepository(SpModule.spUtil());
}