import 'package:social_network/domain/bloc/navigation_bloc.dart';
import 'package:social_network/domain/bloc/view_bloc.dart';

class ViewModule {
  static NavigationBloc navigationBloc(){
    return NavigationBloc(viewBloc());
  }

  static ViewBloc viewBloc(){
    return ViewBloc();
  }
}
