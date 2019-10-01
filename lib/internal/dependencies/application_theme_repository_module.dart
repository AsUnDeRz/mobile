import 'package:catalog_app/data/repository/application_theme_data_repository.dart';

import 'sp_module.dart';

class ApplicationThemeRepositoryModule {
  static final applicationThemeRepository = ApplicationThemeDataRepository(SpModule.spUtil());
}