import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../widgets/vehicle_marker.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  void _onMenuClick(BuildContext context, String ruta) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Navegar a $ruta')));
    // Acá podrías usar Navigator.push para ir a otra pantalla
  }

  @override
  Widget build(BuildContext context) {
    final LatLng punto1 = LatLng(-34.6037, -58.3816); // Ejemplo: Buenos Aires
    final LatLng punto2 = LatLng(-34.61, -58.38);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Align(alignment: Alignment.center, child: Text('Mi App')),
        actions: [
          TextButton(
            onPressed: () => _onMenuClick(context, 'Home'),
            child: Text('Home', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => _onMenuClick(context, 'Perfil'),
            child: Text('Perfil', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => _onMenuClick(context, 'Ajustes'),
            child: Text('Ajustes', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(-34.6037, -58.3816), // Buenos Aires
          zoom: 13,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.tuempresa.tuapp', // 👈 Reemplazá esto
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: punto1,
                width: 60,
                height: 60,
                child: VehicleMarker(label: 'Auto1', color: Colors.blue),
              ),
              Marker(
                point: punto2,
                width: 60,
                height: 60,
                child: VehicleMarker(label: 'Moto2', color: Colors.yellow),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
