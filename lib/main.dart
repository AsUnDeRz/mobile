import 'package:flutter/material.dart';

import 'package:drafts/screns.dart';
import 'package:flutter/services.dart';

void main() => runApp(Application());

class Application extends StatefulWidget {

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Animation app'),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child:
            LayoutBuilder(
              builder:(BuildContext context, BoxConstraints constraint) =>
                  Center(
                    child: ListView(
                      padding: EdgeInsets.all(constraint.maxWidth * .1) ,
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.all (constraint.maxWidth * .03),
                          child: Text(
                            'Car',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () =>Navigator.push(context,
                            MaterialPageRoute(
                              builder:   (_) => CarScreen(),
                            ),
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.all (constraint.maxWidth * .03),
                          child: Text(
                            'Curve',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () =>Navigator.push(context,
                            MaterialPageRoute(
                              builder: (_) =>  CurveScreen(),
                            ),
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.all (constraint.maxWidth * .03),
                          child: Text(
                            'Wolf rotate',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () =>Navigator.push(context,
                            MaterialPageRoute(
                              builder: (_) =>  WolfRotateScreen(),
                            ),
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.all (constraint.maxWidth * .03),
                          child: Text(
                            'Wolf scale',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () =>Navigator.push(context,
                            MaterialPageRoute(
                              builder: (_) =>  WolfScaleScreen(),
                            ),
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.all (constraint.maxWidth * .03),
                          child: Text(
                            'Wolf fade',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () =>Navigator.push(context,
                            MaterialPageRoute(
                              builder: (_) =>  WolfFadeScreen(),
                            ),
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.all (constraint.maxWidth * .03),
                          child: Text(
                            'Simulate gravity',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () =>Navigator.push(context,
                            MaterialPageRoute(
                              builder: (_) =>  SimulateGravityScreen(),
                            ),
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.all (constraint.maxWidth * .03),
                          child: Text(
                            'Physics splash',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () =>Navigator.push(context,
                            MaterialPageRoute(
                              builder: (_) =>  PhysicsSplashScreen(),
                            ),
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.all (constraint.maxWidth * .03),
                          child: Text(
                            'Wolf rotate gesture',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () =>Navigator.push(context,
                            MaterialPageRoute(
                              builder: (_) =>  WolfRotateGestureScreen(),
                            ),
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.all (constraint.maxWidth * .03),
                          child: Text(
                            'Wolf rotate gesture set state',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () =>Navigator.push(context,
                            MaterialPageRoute(
                              builder: (_) =>  WolfRotateGestureSetStateScreen(),
                            ),
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.all (constraint.maxWidth * .03),
                          child: Text(
                            'Radial menu',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () =>Navigator.push(context,
                            MaterialPageRoute(
                              builder: (_) =>  RadialMenuScreen(),
                            ),
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.all (constraint.maxWidth * .03),
                          child: Text(
                            'Skeleton effect',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () =>Navigator.push(context,
                            MaterialPageRoute(
                              builder: (_) =>  SkeletonEffectScreen(),
                            ),
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.all (constraint.maxWidth * .03),
                          child: Text(
                            'Loading button',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () =>Navigator.push(context,
                            MaterialPageRoute(
                              builder: (_) =>  LoadingButtonScreen(),
                            ),
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.all (constraint.maxWidth * .03),
                          child: Text(
                            'Circle avatar',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () =>Navigator.push(context,
                            MaterialPageRoute(
                              builder: (_) =>  CircleAvatarScreen(),
                            ),
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.all (constraint.maxWidth * .03),
                          child: Text(
                            'Thanos snap',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () =>Navigator.push(context,
                            MaterialPageRoute(
                              builder: (_) =>  ThanosSnapScreen(),
                            ),
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.all (constraint.maxWidth * .03),
                          child: Text(
                            'Shake screen',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () =>Navigator.push(context,
                            MaterialPageRoute(
                              builder: (_) =>  ShakeScreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
        ),
      );
}