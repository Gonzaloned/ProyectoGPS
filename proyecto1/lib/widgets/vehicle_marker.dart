// lib/widgets/vehicle_marker.dart
import 'package:flutter/material.dart';
import 'pulsating_marker.dart'; // si usás el efecto animado

class VehicleMarker extends StatelessWidget {
  final String label;
  final Color color;

  const VehicleMarker({
    super.key,
    required this.label,
    this.color = Colors.red,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PulsatingMarker(color: color),
        SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
            backgroundColor: Colors.white.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
