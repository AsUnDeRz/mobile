import 'package:flutter/material.dart';

class InteractiveWidget extends StatefulWidget {
  final Widget child;
  final Color tappedColor;
  final Function() onTap;
  final Function() onTapDown;
  final Function() onTapEnd;
  final Function() onTapCancel;
  final EdgeInsetsGeometry touchPadding;

  InteractiveWidget({
    @required this.child,
    this.tappedColor = Colors.grey,
    this.touchPadding = EdgeInsets.zero,
    this.onTap,
    this.onTapDown,
    this.onTapEnd,
    this.onTapCancel
  });

  @override
  _InteractiveWidgetState createState() => _InteractiveWidgetState();
}

class _InteractiveWidgetState extends State<InteractiveWidget> {
  bool _tapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: _getChild(),
      onTap: () {
        widget.onTap?.call();
      },
      onTapDown: (_) {
        _setTapped(true);
        widget.onTapDown?.call();
      },
      onTapUp: (_) async {
        widget.onTapEnd?.call();
        await Future.delayed(Duration(milliseconds: 300));
        _setTapped(false);
      },
      onTapCancel: () {
        _setTapped(false);
        widget.onTapCancel?.call();
      },
    );
  }

  void _setTapped(bool value) {
    if (this.mounted) setState(() {
      _tapped = value;
    });
  }

  Widget _getChild() {
    return Container(
      padding: widget.touchPadding,
      child: _tapped
        ? ColorFiltered(
            colorFilter: ColorFilter.mode(
              widget.tappedColor,
              BlendMode.srcATop,
            ),
            child: widget.child,
          )
        : widget.child,
    );
  }
}
