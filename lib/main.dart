import 'package:flutter/material.dart';

import 'package:animation_app/screns.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {

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
                  Container(
                    padding: EdgeInsets.all(constraint.maxWidth * .1) ,
                    child: Center(
                      child: ListView(
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
                        ],
                      ),
                    ),
                  ),
            ),
          ),
        ),
      );
}