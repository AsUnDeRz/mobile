import 'package:flutter/material.dart';
import 'base_select.dart';

class CustomRadioButton extends StatelessWidget {
  final double size;
  final bool selected;
  final Color color;
  final double innerOffsetRadius;
  final double strokeWidth;
  final ValueChanged<bool> onChange;

  const CustomRadioButton({
    Key key,
    this.size = 10.0,
    this.selected = false,
    this.color = Colors.grey,
    this.onChange,
    this.innerOffsetRadius = 4.5,
    this.strokeWidth = 2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseSelect(
      selected: selected,
      onChange: onChange,
      builder: (BuildContext context, Animation animation) {
        return Container(
          width: size,
          height: size,
          child: CustomPaint(
           painter: CustomRadioButtonPainter(
             innerOffsetRadius: innerOffsetRadius,
             strokeWidth: strokeWidth,
             animation: animation,
             checked: true,
             color: color,
           ),
          ),
        );
      },
    );
  }
}

class CustomRadioButtonPainter extends CustomPainter {
  final Animation animation;
  final Color color;
  final bool checked;
  final double innerOffsetRadius;
  final double strokeWidth;


  CustomRadioButtonPainter({this.animation, this.checked, this.color, this.innerOffsetRadius = 4.5, this.strokeWidth = 2})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final Paint borderPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Paint innerCirclePaint = Paint()
//      ..color = color.withOpacity(animation.value);
      ..color = color;


    canvas.drawCircle(center, size.width / 2, borderPaint);

    canvas.drawCircle(center, (size.width / 2 - innerOffsetRadius) * animation.value, innerCirclePaint);
  }

  @override
  bool shouldRepaint(CustomRadioButtonPainter oldDelegate) {
    return oldDelegate.checked != checked;
  }
}