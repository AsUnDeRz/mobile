import 'package:flutter/material.dart';


class LoadersWidget {
  static Widget loaderPost(){
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LoaderPageStandard(),
          Container(height: 30),
          Text(
            "Sorry, load :(",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class LoaderPageStandard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class FadeAnimation extends StatefulWidget {
  FadeAnimation(
      {this.child, this.duration = const Duration(milliseconds: 2000), this.initOpacity =.0});

  final Widget child;
  final Duration duration;
  final  double initOpacity;

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: widget.duration, vsync: this);
    animationController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    animationController.forward(from: widget.initOpacity);
  }

//  @override
//  void didUpdateWidget(FadeAnimation oldWidget) {
//    super.didUpdateWidget(oldWidget);
//    if (oldWidget.child != widget.child) {
//      animationController.forward(from: .0);
//    }
//  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animationController.value,
      child: widget.child,
    );
  }
}

class SkeletonEffect extends StatefulWidget {
  final double height;
  final double width;

  SkeletonEffect({Key key, this.height = 20, this.width = 200})
      : super(key: key);

  createState() => _SkeletonEffectState();
}

class _SkeletonEffectState extends State<SkeletonEffect>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation gradientPosition;

  @override
  void initState() {
    _controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);

    gradientPosition = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
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
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(gradientPosition.value, 0),
          end: Alignment(-1, 0),
          colors: [Colors.white12, Colors.white24, Colors.white12],
        ),
      ),
    );
  }
}