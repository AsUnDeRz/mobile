import 'package:catalog_app/domain/model/theme_mode_application.dart';
import 'package:catalog_app/domain/repository/theme_mode_application_repository.dart';

class GetThemeModeApplicationStreamCase {
  final ThemeModeApplicationRepository _themeModeRepository;

  GetThemeModeApplicationStreamCase(this._themeModeRepository);

  Stream<ThemeModeApplication> getThemeModeApplicationStream() {
    return _themeModeRepository.getThemeModeApplicationStream();
  }
}