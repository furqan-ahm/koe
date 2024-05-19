import 'package:flutter/material.dart';

class SpringButton extends StatefulWidget {
  const SpringButton({Key? key, this.child, this.onTap}) : super(key: key);

  final Widget? child;
  final VoidCallback? onTap;

  @override
  State<SpringButton> createState() => _SpringButtonState();
}

class _SpringButtonState extends State<SpringButton> {
  bool isTapped = false;

  toggleSpring(bool val) {
    if (widget.onTap != null) setState(() => isTapped = val);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isTapped ? 0.95 : 1,
      duration: const Duration(milliseconds: 80),
      child: GestureDetector(
          onTapDown: (dt) {
            toggleSpring(true);
          },
          onTapCancel: () {
            toggleSpring(false);
          },
          onTapUp: (det) {
            toggleSpring(false);
            widget.onTap?.call();
          },
          child: widget.child),
    );
  }
}