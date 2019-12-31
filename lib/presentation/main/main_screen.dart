import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_network/presentation/design/application_design.dart';



class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
//  final NavigationBloc _navigationBloc = NavigationModule.navigationBloc();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              color: Colors.amber,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.2)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.menu,
                            color: Colors.white.withOpacity(.5),
                          ),
                          Text("Menu")
                        ],
                      ),
                      splashColor: Colors.black.withOpacity(.6),
                      onPressed: (){},
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.zero,
                    ),
                    FlatButton(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.collections,
                            color: Colors.white.withOpacity(.5),
                          ),
                          Text("Flow")
                        ],
                      ),
                      splashColor: Colors.black.withOpacity(.6),
                      onPressed: (){},
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.zero,
                    ),
                    FlatButton(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.portrait,
                            color: Colors.white.withOpacity(.5),
                          ),
                          Text("Profile")
                        ],
                      ),
                      splashColor: Colors.black.withOpacity(.6),
                      onPressed: (){},
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.zero,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        resizeToAvoidBottomInset : false,
      ),
//      BlocBuilder<NavigationBloc, NavigationState>(
//        bloc: _navigationBloc,
//        builder: (context, state) {
//          if (state is PageNavigationState) {
//            return _getBody(state);
//          } else {
//            return Container();
//          }
//        },
//      ),
    );
  }
}
