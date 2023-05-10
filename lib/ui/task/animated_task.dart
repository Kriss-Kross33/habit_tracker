import 'package:flutter/material.dart';
import 'package:habit_tracker/ui/task/task.dart';

import '../../constants/constants.dart';
import '../../themes/app_theme.dart';
import '../common/common.dart';

class AnimatedTask extends StatefulWidget {
  const AnimatedTask({
    super.key,
    required this.iconName,
  });

  final String iconName;

  @override
  State<AnimatedTask> createState() => _AnimatedTaskState();
}

class _AnimatedTaskState extends State<AnimatedTask>
    with SingleTickerProviderStateMixin<AnimatedTask> {
  late AnimationController _animationController;
  late Animation<double> _curveAnimation;
  bool _showCheckIcon = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 650));
    _animationController.addStatusListener(_checkStatusUpdate);
    _curveAnimation = _animationController.drive<double>(
      CurveTween(curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.removeStatusListener(_checkStatusUpdate);
    _animationController.dispose();
    super.dispose();
  }

  void _handleOnTapCancel() {
    if (_animationController.status != AnimationStatus.completed) {
      _animationController.reverse();
    }
  }

  void _handleOnTapDown(TapDownDetails details) {
    if (_animationController.status == AnimationStatus.completed &&
        !_showCheckIcon) {
      _animationController.reset();
    } else {
      _animationController.forward();
    }
  }

  Future<void> _checkStatusUpdate(AnimationStatus status) async {
    if (status == AnimationStatus.completed) {
      if (context.mounted) {
        setState(() {
          _showCheckIcon = true;
        });
      }
      await Future.delayed(const Duration(seconds: 3), () {
        if (context.mounted) {
          setState(() {
            _showCheckIcon = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleOnTapDown,
      onTapUp: (_) => _handleOnTapCancel(),
      onTapCancel: _handleOnTapCancel,
      child: AnimatedBuilder(
          animation: _curveAnimation,
          builder: (context, child) {
            final themeData = AppTheme.of(context);
            final progress = _curveAnimation.value;
            final hasCompleted = progress == 1.0;
            return Stack(
              children: [
                TaskCompletionRing(
                  progress: progress,
                ),
                Positioned.fill(
                  child: CenteredSvgIcon(
                    iconName: hasCompleted && _showCheckIcon
                        ? AppAssets.check
                        : widget.iconName,
                    color: hasCompleted
                        ? themeData.accentNegative
                        : themeData.taskIcon,
                  ),
                )
              ],
            );
          }),
    );
  }
}
