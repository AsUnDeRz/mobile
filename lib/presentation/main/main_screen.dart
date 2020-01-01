import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/presentation/design/application_design.dart';
import 'package:social_network/presentation/main/widgets/drawer_navigation_widget.dart';
import 'package:social_network/presentation/main/widgets/navigation_menu/icon_navigation_widget.dart';
import 'package:social_network/presentation/main/widgets/navigation_menu/navigation_menu_widget.dart';
import 'package:social_network/presentation/main/widgets/view_widget.dart';



class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
//  final NavigationBloc _navigationBloc = NavigationModule.navigationBloc();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: DrawerNavigationWidget(),
        ),
        body: Stack(
          children: <Widget>[
            ViewWidget(),
            NavigationMenuWidget(
              scaffoldKey: _scaffoldKey,
            )
          ],
        ),
        resizeToAvoidBottomInset : false,
      ),
    );
  }
}
