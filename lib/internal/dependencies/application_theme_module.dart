import 'package:catalog_app_bloc/domain/bloc/menu_drawer/application_theme_switcher/application_theme_bloc.dart';
import 'package:catalog_app_bloc/internal/dependencies/application_theme_repository_module.dart';

class ApplicationThemeModule {
  static final  applicationThemeBloc = ApplicationThemeBloc(ApplicationThemeRepositoryModule.applicationThemeRepository);
}