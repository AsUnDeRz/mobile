import 'package:flutter/material.dart';

class DeactivatableWidget extends StatefulWidget {

  final Widget child;
  final void Function(bool deactivated) onDeactivate;

  DeactivatableWidget({@required this.child, this.onDeactivate});

  @override
  _DeactivatableWidgetState createState() => _DeactivatableWidgetState();
}

class _DeactivatableWidgetState extends State<DeactivatableWidget> {

  bool _deactivated = false;

  @override
  void deactivate() {
    widget.onDeactivate(_deactivated);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return  widget.child;
  }
}