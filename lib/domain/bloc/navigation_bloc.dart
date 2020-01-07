import 'package:bloc/bloc.dart';

import 'view_bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState>{
  final ViewBloc viewBloc;

  NavigationBloc(this.viewBloc);

  @override
  NavigationState get initialState => HomeNavigationState();

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if(event is HomeNavigationEvent){
      viewBloc.add(HomeViewEvent());
      yield HomeNavigationState();
    }
    if(event is ProfileNavigationEvent){
      viewBloc.add(ProfileViewEvent());
      yield ProfileNavigationState();
    }
  }
}

abstract class NavigationEvent {}

class HomeNavigationEvent extends NavigationEvent {}
class ProfileNavigationEvent extends NavigationEvent {}

abstract class NavigationState {}

class HomeNavigationState extends NavigationState {}
class ProfileNavigationState extends NavigationState {}