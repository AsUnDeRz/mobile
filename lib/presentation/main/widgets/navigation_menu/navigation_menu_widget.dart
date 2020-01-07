import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/domain/bloc/navigation_bloc.dart';

import 'icon_navigation_widget.dart';

class NavigationMenuWidget extends StatefulWidget {
  final NavigationBloc navigationBloc;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavigationMenuWidget({Key key, this.scaffoldKey, this.navigationBloc}) : super(key: key);

  @override
  _NavigationMenuWidgetState createState() => _NavigationMenuWidgetState();
}

class _NavigationMenuWidgetState extends State<NavigationMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 56,
        padding: EdgeInsets.symmetric(
          vertical: 6
        ),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(.2)
        ),
        child: BlocBuilder<NavigationBloc, NavigationState>(
          bloc: widget.navigationBloc,
          builder: (context, state) {

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconNavigationWidget(
                  icon: Icons.menu,
                  label: "Menu",
                  onPressed: (){
                    widget.scaffoldKey.currentState.openDrawer();
                  },
                ),
                IconNavigationWidget(
                  icon: Icons.home,
                  label: "Home",
                  isActive: _getIsActiveHome(state),
                  onPressed: (){
//                    if(widget.navigationBloc.state is HomeNavigationState){
//                      return;
//                    }
//
//                    widget.navigationBloc.add(HomeNavigationEvent());
                  },
                ),
                IconNavigationWidget(
                  icon: Icons.portrait,
                  label: "Profile",
                  isActive: _getIsActiveProfile(state),
                  onPressed: (){
//                    if(widget.navigationBloc.state is ProfileNavigationState){
//                      return;
//                    }
//
//                    widget.navigationBloc.add(ProfileNavigationEvent());
                  },
                ),
              ],
            );
          }
        ),
      ),
    );
  }

  bool _getIsActiveHome(NavigationState state){
    return state is HomeNavigationState;
  }
  bool _getIsActiveProfile(NavigationState state){
    return state is ProfileNavigationState;
  }
}