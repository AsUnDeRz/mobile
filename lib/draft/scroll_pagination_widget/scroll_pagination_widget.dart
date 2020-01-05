import 'package:flutter/material.dart';

class ScrollPaginationWidget extends StatefulWidget {
  final Widget child;
  final double offsetScrollAction;
  final void Function() nextPageAction;


  const ScrollPaginationWidget({Key key, this.child, this.offsetScrollAction, @required this.nextPageAction}) : super(key: key);
  
  @override
  _ScrollPaginationWidgetState createState() => _ScrollPaginationWidgetState();
}

class _ScrollPaginationWidgetState extends State<ScrollPaginationWidget> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 10),
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      child: widget.child ?? Container(),
    );
  }

  _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent - (widget.offsetScrollAction ?? 0) &&
        !_scrollController.position.outOfRange) {
      widget.nextPageAction();
    }
  }
}