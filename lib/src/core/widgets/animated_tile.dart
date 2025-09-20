import 'package:flutter/material.dart';

class AnimatedTile extends StatefulWidget {
  const AnimatedTile({
    super.key,
    required this.index,
    this.delay = 200,
    required this.child,
  });

  final int index;
  final int delay;
  final Widget child;

  @override
  State<AnimatedTile> createState() => _AnimatedTileState();
}

class _AnimatedTileState extends State<AnimatedTile> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: widget.delay * widget.index), () {
      if (mounted) {
        setState(() => _opacity = 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      child: widget.child,
    );
  }
}
