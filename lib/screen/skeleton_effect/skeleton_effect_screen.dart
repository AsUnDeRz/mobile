import 'package:flutter/material.dart';

class SkeletonEffectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        children: <Widget>[
          Container(
            height: 150,
            child: Card(
              elevation: 5,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: SkeletonEffect(),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: SkeletonEffect(),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: SkeletonEffect(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SkeletonEffect extends StatefulWidget {
  final double height;
  final double width;

  SkeletonEffect({Key key, this.height = 20, this.width = 200 }) : super(key: key);

  createState() => _SkeletonEffectState();
}

class _SkeletonEffectState extends State<SkeletonEffect> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation gradientPosition;

  @override
  void initState() {
    _controller = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);

    gradientPosition = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
      CurvedAnimation(
          parent: _controller,
          curve: Curves.linear
      ),
    )..addListener(() {
      setState(() {});
    });

    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width:  widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(gradientPosition.value, 0),
                end: Alignment(-1, 0),
                colors: [Colors.black12, Colors.black26, Colors.black12]
            )
        ),
      ),
    );
  }
}