import 'package:flutter/material.dart';

import 'icon_navigation_widget.dart';

class NavigationMenuWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavigationMenuWidget({Key key, this.scaffoldKey}) : super(key: key);

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
            color: Colors.black.withOpacity(.25)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconNavigationWidget(
              icon: Icons.menu,
              label: "Menu",
              onPressed: (){
                scaffoldKey.currentState.openDrawer();
              },
            ),
            IconNavigationWidget(
              icon: Icons.home,
              label: "Home",
              onPressed: (){},
            ),
            IconNavigationWidget(
              icon: Icons.portrait,
              label: "Profile",
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }

}