//import 'package:flutter/material.dart';
//
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
//          return Stack(
//            children: <Widget>[
//              Container(
//                height: MediaQuery.of(context).size.height,
//                width: MediaQuery.of(context).size.width,
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: Container(color: Colors.red),
//                    ),
//                    Expanded(
//                      child: Container(color: Colors.white),
//                    ),
//                    Expanded(
//                      child: Container(color: Colors.black),
//                    ),
//                    Expanded(
//                      child: Container(color: Colors.blueAccent),
//                    ),
//                    Expanded(
//                      child: Container(color: Colors.yellow),
//                    ),
//                    Expanded(
//                      child: Container(color: Colors.green),
//                    ),
//                  ],
//                ),
//              ),
//              SwipeablePostWidget(
//                onHorizontalSwipe: (SwipeDirection swipeDirection) {
//                  if (swipeDirection == SwipeDirection.right) {}
//                  if (swipeDirection == SwipeDirection.left) {}
//                },
//                swipeConfig: SimpleSwipeConfig(
//                  swipeDetectionBehavior:
//                  SwipeDetectionBehavior.continuousDistinct,
//                  horizontalThreshold:
//                  MediaQuery.of(context).size.width * 1 / 8,
//                  verticalThreshold: MediaQuery.of(context).size.height * 1 / 8,
//                ),
//                child: Stack(
//                  children: <Widget>[
//                    ImagePostWidget(
//                      imageUrl: widget.homeBloc.listRecommendations[0].fileUrl,
//                      likeIcon: LikeWidget(),
//                    ),
////                    CommentWidget(),
//                  ],
//                ),
//              ),
//            ],
//          );
//        },
//      ),
//    );
//  }
//}
