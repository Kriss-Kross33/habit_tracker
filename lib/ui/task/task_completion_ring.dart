import 'dart:math';

import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';

class TaskCompletionRing extends StatelessWidget {
  const TaskCompletionRing({
    super.key,
    required this.progress,
  });

  final double progress;

  @override
  Widget build(BuildContext context) {
    final themeData = AppTheme.of(context);
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        painter: RingCustomPainter(
          progress: progress,
          taskCompletedColor: themeData.accent,
          taskNotCompletedColor: themeData.taskRing,
        ),
      ),
    );
  }
}

class RingCustomPainter extends CustomPainter {
  RingCustomPainter({
    required this.progress,
    required this.taskCompletedColor,
    required this.taskNotCompletedColor,
  });

  final double progress;
  final Color taskNotCompletedColor;
  final Color taskCompletedColor;

  @override
  void paint(Canvas canvas, Size size) {
    final notCompleted = progress < 1.0;
    final strokeWidth = size.width / 15.0;
    final radius =
        notCompleted ? (size.width - strokeWidth) * 0.5 : size.width * 0.5;
    final center = Offset(size.width * 0.5, size.width * 0.5);
    if (notCompleted) {
      final backgroundPaint = Paint()
        ..isAntiAlias = true
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..color = taskNotCompletedColor;
      canvas.drawCircle(center, radius, backgroundPaint);
    }
    final foregroundPaint = Paint()
      ..isAntiAlias = true
      ..style = notCompleted ? PaintingStyle.stroke : PaintingStyle.fill
      ..color = taskCompletedColor
      ..strokeWidth = strokeWidth;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant RingCustomPainter oldDelegate) => true;
}
