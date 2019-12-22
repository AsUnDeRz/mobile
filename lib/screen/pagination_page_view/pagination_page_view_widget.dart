//import 'package:flutter/material.dart';
//import 'package:shake/shake.dart';
//import 'package:simple_gesture_detector/simple_gesture_detector.dart';
//import 'package:vibration/vibration.dart';
//
//import 'package:p1440/domain/model/post.dart';
//
//class PaginationPageViewWidget extends StatefulWidget {
//  final List<Post> listPosts;
//  final Widget Function(
//    BuildContext context,
//    List<Post> listPosts,
//    int currentPage,
//    int  prevPage,
//    int nextPage
//  ) itemBuilder;
//  final Function(
//    BuildContext context,
//    List<Post> listPosts,
//      int currentPage,
//      int  prevPage,
//    PageController pageController,
//  ) onIndexChanged;
//  final Function(
//    BuildContext context,
//    PageController pageController,
//      int currentPage,
//      int  prevPage,
//  ) onRightSwipe;
//  final Function(
//    BuildContext context,
//    PageController pageController,
//      int currentPage,
//      int  prevPage,
//  ) onLeftSwipe;
//  final Function(
//    BuildContext context,
//    PageController pageController,
//      int currentPage,
//      int  prevPage,
//  ) onShake;
//
//  const PaginationPageViewWidget({
//    Key key,
//    this.listPosts,
//    this.itemBuilder,
//    this.onIndexChanged,
//    this.onRightSwipe,
//    this.onLeftSwipe,
//    this.onShake,
//  }) : super(key: key);
//
//  @override
//  _PaginationPageViewWidgetState createState() =>
//      _PaginationPageViewWidgetState();
//}
//
//class _PaginationPageViewWidgetState extends State<PaginationPageViewWidget> {
//  PageController pageController;
//  ShakeDetector detector;
//  int currentPage;
//  int prevPage;
//
//  @override
//  void initState() {
//    super.initState();
//    detector = ShakeDetector.waitForStart(
//      onPhoneShake: () {
//        Vibration.vibrate(duration: 1000);
//        pageController.nextPage(
//            duration: Duration(seconds: 1), curve: Curves.easeIn);
//      },
//    );
//    detector.startListening();
//    pageController = PageController();
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    detector.stopListening();
//    pageController.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return
// PageView.builder(
//        controller: pageController,
//        scrollDirection: Axis.vertical,
//        itemCount: widget.listPosts.length + 1,
//        onPageChanged: (index) {
//          if(currentPage == null){
//            currentPage = index;
//          } else if(index == 0) {
//            currentPage = 0;
//            prevPage = null;
//          } else{
//            prevPage = currentPage;
//            currentPage = index;
//          }
//          widget.onIndexChanged(
//            context,
//            widget.listPosts,
//            currentPage,
//            prevPage,
//            pageController,
//          );
//        },
//        itemBuilder: (context, index) {
//          return widget.itemBuilder(context, widget.listPosts, currentPage, prevPage, index);
//        },
//    );
//  }
//}
