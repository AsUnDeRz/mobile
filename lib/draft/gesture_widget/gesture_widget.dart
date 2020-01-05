//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:p1440/presentation/design/general_dialog/dialog/home/comment_widget.dart';
//import 'package:p1440/presentation/home/widget/body/image/image_post_widget.dart';
//import 'package:p1440/presentation/home/widget/body/swipeable_post_widget.dart';
//import 'package:p1440/domain/bloc/home/home_bloc.dart';
//
//import 'like_widget.dart';
//
//class HomeBodyPostWidget extends StatefulWidget {
//  final HomeBloc homeBloc;
//
//  const HomeBodyPostWidget({Key key, this.homeBloc}) : super(key: key);
//
//  @override
//  _HomeBodyPostWidgetState createState() => _HomeBodyPostWidgetState();
//}
//
//class _HomeBodyPostWidgetState extends State<HomeBodyPostWidget>
//    with SingleTickerProviderStateMixin {
//  Offset position = Offset(0, 0);
//  Offset beginOffset;
//  Offset currentOffset;
//  Animation<double> _animation;
//  AnimationController _controller;
//
//  @override
//  void initState() {
//    _controller = AnimationController(
//        vsync: this, duration: Duration(milliseconds: 1000));
//
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: BlocBuilder<HomeBloc, HomeState>(
//        bloc: widget.homeBloc,
//        condition: (current, next) {
//          return true;
//        },
//        builder: (context, state) {
////          GestureDetector(
//////            onVerticalDragStart: ,
//////            onVerticalDragUpdate: ,
//////            onVerticalDragEnd: ,
//////            onHorizontalDragStart: ,
//////            onHorizontalDragUpdate: ,
//////            onHorizontalDragEnd: ,
////            onPanStart: (details) => _onPanStart(context, details),
////            onPanUpdate: (details) => _onPanUpdate(context, details, position),
////            onPanEnd: (details) => _onPanEnd(context, details),
////            onPanCancel: () => _onPanCancel(context),
////            child: Stack(
////              children: <Widget>[
////                Container(
////                  height: MediaQuery.of(context).size.height,
////                  width: MediaQuery.of(context).size.width,
////                  child: Row(
////                    children: <Widget>[
////                      Expanded(
////                        child: Container(
////                          color: Colors.red
////                        ),
////                      ),
////                      Expanded(
////                        child: Container(
////                          color: Colors.white
////                        ),
////                      ),
////                      Expanded(
////                        child: Container(
////                          color: Colors.black
////                        ),
////                      ),
////                      Expanded(
////                        child: Container(
////                          color: Colors.blueAccent
////                        ),
////                      ),
////                      Expanded(
////                        child: Container(
////                          color: Colors.yellow
////                        ),
////                      ),
////                      Expanded(
////                        child: Container(
////                          color: Colors.green
////                        ),
////                      ),
////                    ],
////                  ),
////                ),
////                AnimatedPositioned(
////                  duration: Duration(milliseconds: 100),
////                  top: position.dy,
////                  left: position.dx,
////                  child: Container(
////                      height: MediaQuery.of(context).size.height,
////                      width: MediaQuery.of(context).size.width,
////                      child: ImagePostWidget(
////                        imageUrl:
////                            widget.homeBloc.listRecommendations[0].fileUrl,
////                        likeIcon: LikeWidget(),
////                      )),
////                ),
////              ],
////            ),
////          );
//
////          if(state is RefreshHomeState) {
////            return Stack(
////              children: <Widget>[
////                Center(
////                  child: Draggable(
////                    child:
////                    ImagePostWidget(
////                      imageUrl: widget.homeBloc.listRecommendations[0].fileUrl,
////                      likeIcon: LikeWidget(),
////                    ),
////                    feedback: Container(
////                      height: MediaQuery.of(context).size.height,
////                      width: MediaQuery.of(context).size.width,
////                      child: ImagePostWidget(
////                        imageUrl: widget.homeBloc.listRecommendations[0].fileUrl,
////                        likeIcon: LikeWidget(),
////                      ),
////                    ),
////                    childWhenDragging: Container(
////                      alignment: Alignment.center,
////                    ),
////                  ),
////                ),
////              ],
////            );
////          }
////           return  Stack(
////              children: <Widget>[
////                Draggable(
////                  child:
////                      ImagePostWidget(
////                        imageUrl: widget.homeBloc.listRecommendations[0].fileUrl,
////                        likeIcon: LikeWidget(),
////                      ),
////                  feedback: Container(
////                    height: MediaQuery.of(context).size.height,
////                    width: MediaQuery.of(context).size.width,
////                    child: ImagePostWidget(
////                      imageUrl: widget.homeBloc.listRecommendations[0].fileUrl,
////                      likeIcon: LikeWidget(),
////                    ),
////                  ),
////                  childWhenDragging: Container(
////                    alignment: Alignment.center,
////                  ),
////                  onDragStarted: (){
////                    return;
////                  },
////                ),
////                Positioned(
////                  top: position.dy,
////                  left: position.dx,
////                  child: Container(
////                    height: MediaQuery.of(context).size.height,
////                    width: MediaQuery.of(context).size.width,
////                    child: Draggable(
////                      child:
////                      ImagePostWidget(
////                        imageUrl: widget.homeBloc.listRecommendations[1].fileUrl,
////                        likeIcon: LikeWidget(),
////                      ),
////                      feedback: Container(
////                        height: MediaQuery.of(context).size.height,
////                        width: MediaQuery.of(context).size.width,
////                        child: ImagePostWidget(
////                          imageUrl: widget.homeBloc.listRecommendations[1].fileUrl,
////                          likeIcon: LikeWidget(),
////                        ),
////                      ),
////                      childWhenDragging: Container(
////                        alignment: Alignment.center,
////                      ),
////                      onDraggableCanceled: (Velocity velocity,Offset offset) {
////                        Tween tween = Tween<double>(begin: 0.0, end: MediaQuery.of(context).size.width * 2);
////                        _animation = tween.animate(_controller);
////                        _animation.addListener(() {
////                          setState(() {
////                            position = Offset(offset.dx + _animation.value, offset.dy, );
////                          });
////                        });
////                        _controller.forward();
////                        _animation.addStatusListener((status) {
////                          if(status == AnimationStatus.completed) {
////                            widget.homeBloc.add(NextPostHomeEvent(0));
////                          }
////                        });
////
////                        final t = velocity.pixelsPerSecond;
////                        var f =t;
////
////                      },
////                      onDragCompleted: (){
////
////                      },
////                    ),
////                  ),
////                ),
////              ],
////            );
//
//        },
//      ),
//    );
//  }
//
//  void _onPanStart(BuildContext context, DragStartDetails details) {
//    beginOffset = details.globalPosition;
//  }
//
//  void _onPanUpdate(
//      BuildContext context, DragUpdateDetails details, Offset offset) {
//    currentOffset = details.globalPosition;
//    print("${details.delta.direction} ${details.delta.direction}");
//    if (details.delta.dy > 0) {}
//    if (details.delta.dy < 0) {}
//    if (details.delta.dx < 0) {}
//    if (details.delta.dx > 0) {}
////    else()
//    setState(() {
////      position = details.globalPosition;
////      position = Offset( details.globalPosition.dx - MediaQuery.of(context).size.width/2 , details.globalPosition.dy - MediaQuery.of(context).size.height/2 );
//      position = Offset(details.globalPosition.dx - beginOffset.dx,
//          details.globalPosition.dy - beginOffset.dy);
//    });
//  }
//
//  void _onPanEnd(BuildContext context, DragEndDetails details) {
//    if (position.dx > MediaQuery.of(context).size.width / 6) {
//      Tween tween =
//      Tween<double>(begin: 0.0, end: MediaQuery.of(context).size.width * 2);
//      _animation = tween.animate(_controller);
//      _animation.addListener(() {
////      print("${position.dx}");
//        setState(() {
//          position = Offset(position.dx + _animation.value, position.dy);
//        });
//      });
//      _controller.forward();
//      _animation.addStatusListener((status) {
//        if (status == AnimationStatus.completed) {
////          widget.homeBloc.add(InitHomeEvent());
//          _controller.reset();
//          setState(() {
//            position = Offset(0, 0);
//          });
//        }
//      });
//      return;
//    }
//
//    setState(() {
//      position = Offset(0, 0);
//    });
////    if(){
////      setState(() {
//////      position = details.globalPosition;
////        position = Offset( 0 , 0);
////      });
////    }
//  }
//
//  void _onPanCancel(BuildContext context) {
//    print("Pan canceled !!");
//  }
//}
