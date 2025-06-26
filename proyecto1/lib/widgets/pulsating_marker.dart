import 'package:flutter/material.dart';

class PulsatingMarker extends StatefulWidget {
  final Color color;
  final double size;

  const PulsatingMarker({super.key, this.color = Colors.red, this.size = 40});

  @override
  // ignore: library_private_types_in_public_api
  State<PulsatingMarker> createState() => _PulsatingMarkerState();
}

class _PulsatingMarkerState extends State<PulsatingMarker>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _scale = Tween<double>(
      begin: 1.0,
      end: 1.4,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scale,
      builder: (context, child) {
        return Transform.scale(scale: _scale.value, child: child);
      },
      child: Icon(Icons.location_on, color: widget.color, size: widget.size),
    );
  }
}
