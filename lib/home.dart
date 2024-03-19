import 'package:flutter/material.dart';
import 'package:medicamentos/models/MedicamentoManager.dart';

import 'package:medicamentos/pantallas/Agenda.dart';
import 'package:medicamentos/pantallas/AgregarMedicamento.dart';
import 'package:medicamentos/pantallas/MisMedicamentos.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState(medicamentoManager: MedicamentoManager());
}


class _HomeState extends State<Home> {
  int _selectedIndex = 0;           // Índice seleccionado en la barra de navegación inferior.
  bool _modoOscuro = false;        // Variable que controla el modo oscuro.
  final MedicamentoManager medicamentoManager;

  // Constructor que recibe un objeto MedicamentoManager
  _HomeState({required this.medicamentoManager});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _modoOscuro ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Medicamentos"),  // Título de la AppBar
          actions: [ // acciones del appBar
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                //  lógica para  las notificaciones
              },
            ),
          ],

        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF004E7F),
                ),
                child: Text(
                  'Opciones',           // Título del DrawerHeader.
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('Ajustes'),   // Elemento  Ajustes
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Cuenta'),    // Elemento  Cuenta
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Text('Modo Oscuro'),    // Elemento para Modo Oscuro.
                    Spacer(),
                    Switch(
                      value: _modoOscuro,   // Valor del switch
                      onChanged: (value) {
                        setState(() {
                          _modoOscuro = value;  // Actualiza el modo oscuro
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: _selectedIndex == 0
            ? AgregarMedicamento(medicamentoManager: medicamentoManager)  // Página para agregar medicamento.
            : _selectedIndex == 1
                ? Agenda()                // Página de la agenda.
                : _selectedIndex == 2
                    ? MisMedicamentos()    // Página de mis medicamentos.
                    : Container(),          
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,       // Índice barra inferior
          onTap: (index) {
            setState(() {
              _selectedIndex = index;          // Actualiza el índice al tocar un ítem de la barra inferior.
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Añadir medicamento',     // Ítem de la barra inferior para agregar medicamento.
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Agenda',                 // Ítem de la barra inferior para la agenda.
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_pharmacy),
              label: 'Mis Medicamentos',       // Ítem de la barra inferior para mis medicamentos.
            ),
          ],
        ),
      ),
    );
  }
}
