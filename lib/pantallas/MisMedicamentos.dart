import 'package:flutter/material.dart';
/////////////////////////////////////////////////////////////////////
/////////// Clase para pantalla de "Mis Medicamentos".//////////////
////////////////////////////////////////////////////////////////////
class MisMedicamentos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Configuración del Scaffold con AppBar 
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Medicamentos'),  // Título de la AppBar
      ),
      body: Center(
        child: Text('Lista de Medicamentos'),  // cuerpo centralizado
      ),
    );
  }
}
