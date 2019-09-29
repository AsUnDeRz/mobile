import 'package:catalog_app/domain/model/theme_mode_application.dart';
import 'package:catalog_app/domain/repository/theme_mode_application_repository.dart';

class GetThemeModeApplicationCase {
  final ThemeModeApplicationRepository _themeModeRepository;

  GetThemeModeApplicationCase(this._themeModeRepository);

  Future<ThemeModeApplication> getThemeModeApplication() {
    return _themeModeRepository.getThemeModeApplication();
  }
}