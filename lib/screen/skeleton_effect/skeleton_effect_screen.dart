import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:clippy_flutter/ticket.dart';
import 'package:flutter/material.dart';

class SkeletonEffectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black87,
        child: PageView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: SkeletonEffect(
                              listColors: [Colors.blue.withOpacity(.6), Colors.blue.withOpacity(.9),Colors.blue.withOpacity(.6)],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: SkeletonEffect(
                                    height: 20,
                                    listColors: [Colors.black12, Colors.black26, Colors.black12],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: SkeletonEffect(
                                    height: 20,
                                    listColors: [Colors.black54, Colors.black12, Colors.black54],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: SkeletonEffect(
                                    height: 20,
                                    listColors: [Colors.black54, Colors.black38, Colors.black87],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height/4,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Spacer(),
                          Expanded(
                            child: SkeletonEffect(
                              listColors: [Colors.deepPurple, Colors.purpleAccent, Colors.purpleAccent],
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height/4,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Spacer(),
                          Expanded(
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(constraints.maxWidth/2),
                                  child: SkeletonEffect(
                                    listColors: [Colors.cyan.withOpacity(.5), Colors.cyan.withOpacity(.6), Colors.cyan.withOpacity(.9)],
                                  ),
                                );
                              }
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular( MediaQuery.of(context).size.width/8),
                                child: Container(
                                  height: MediaQuery.of(context).size.width/4,
                                  width: MediaQuery.of(context).size.width/4,
                                  child: SkeletonEffect(
                                    listColors: [Colors.cyan.withOpacity(.5), Colors.cyan.withOpacity(.6), Colors.cyan.withOpacity(.9)],
                                  ),
                                ),
                              );
                            }
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height/4,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Spacer(),
                          Expanded(
                            child: Ticket(
                              radius: 10,
                              child: SkeletonEffect(
                                listColors: [Colors.blue.withOpacity(.6), Colors.blue.withOpacity(.9),Colors.blue.withOpacity(.6)],
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height/4,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Spacer(),
                          Expanded(
                            child: Star(
                              child: SkeletonEffect(
                                listColors: [Colors.yellow.withOpacity(.6), Colors.yellow.withOpacity(.9),Colors.yellow.withOpacity(.6)],
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}

class SkeletonEffect extends StatefulWidget {
  final List<Color> listColors;
  final double width;
  final double height;


  SkeletonEffect({Key key, this.listColors, this.width, this.height }) : super(key: key);

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
    return LayoutBuilder(
      builder:(context, constraints){
        double heightWidget;
        double widthWidget;
        if(widget.width != null){
          widthWidget = widget.width;
        }
        if(widget.height != null){
          heightWidget = widget.height;
        }
        return Container(
          width: widthWidget ?? constraints.maxWidth,
          height: heightWidget ?? constraints.maxHeight,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(gradientPosition.value, 0),
                  end: Alignment(-1, 0),
                  colors: widget.listColors,
              )
          ),
        );
      },
    );
  }
}