import 'package:flutter/material.dart';

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
      body: Container(
        color: const Color.fromARGB(0, 224, 223, 224),
        child: const Text('GON'),
      ),
    );
  }
}
