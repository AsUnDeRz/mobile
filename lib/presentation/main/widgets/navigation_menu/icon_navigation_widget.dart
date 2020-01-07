import 'package:flutter/material.dart';
import 'package:social_network/presentation/main/widgets/navigation_menu/custom_navigation_widget.dart';

class IconNavigationWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final void Function() onPressed;

  const IconNavigationWidget({
    Key key,
    this.icon,
    this.label,
    this.isActive = false,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: (isActive)
                ? const Color.fromRGBO(255, 255, 255, 1)
                : const Color.fromRGBO(200, 200, 200, .8),
          ),
          Text(label)
        ],
      ),
      onPressed: onPressed,
    );
  }
}