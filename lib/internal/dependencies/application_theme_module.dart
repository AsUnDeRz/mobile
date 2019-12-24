import 'package:catalog_app_bloc/domain/bloc/menu_drawer/application_theme_switcher/refresher_application_theme_bloc.dart';
import 'package:catalog_app_bloc/domain/bloc/menu_drawer/application_theme_switcher/switcher_application_theme_bloc.dart';
import 'package:catalog_app_bloc/internal/dependencies/application_theme_repository_module.dart';

class ApplicationThemeModule {
  static RefresherApplicationThemeBloc refresherApplicationThemeBloc (){
    return RefresherApplicationThemeBloc(ApplicationThemeRepositoryModule.applicationThemeRepository);
  }
  static SwitcherApplicationThemeBloc switcherApplicationThemeBloc (){
    return SwitcherApplicationThemeBloc(ApplicationThemeRepositoryModule.applicationThemeRepository);
  }
}