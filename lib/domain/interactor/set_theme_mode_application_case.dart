import 'package:catalog_app/domain/repository/theme_mode_application_repository.dart';

class SetThemeModeApplicationCase {
  final ThemeModeApplicationRepository _themeModeRepository;

  SetThemeModeApplicationCase(this._themeModeRepository);

  Future<void> setThemeModeApplication(bool themeMode) {
    return _themeModeRepository.setThemeModeApplication(themeMode);
  }
}