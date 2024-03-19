/////////////////////////////////////////////////////////////
///////// Clase para la pantalla de "Ajustes". /////////////
///////////////////////////////////////////////////////////

import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ajustes')),
      body: Center(
        child: Text('Pantalla de Ajustes'),
      ),
    );
  }
}
