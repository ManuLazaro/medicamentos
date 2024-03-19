import 'package:flutter/material.dart';
import 'package:medicamentos/models/MedicamentoManager.dart';
import 'package:medicamentos/pantallas/crearUsuario.dart';
import 'package:medicamentos/home.dart';

void main() => runApp(MyApp(medicamentoManager: MedicamentoManager()));

// Esta es la aplicación
class MyApp extends StatelessWidget {
  final MedicamentoManager medicamentoManager;

  // Constructor que recibe un objeto MedicamentoManager.
  const MyApp({Key? key, required this.medicamentoManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Configuración de la aplicación MaterialApp
    return MaterialApp(
      title: "",
      home: Inicio(medicamentoManager: medicamentoManager),
    );
  }
}

// Pantalla de inicio
class Inicio extends StatefulWidget {
  final MedicamentoManager medicamentoManager;

  const Inicio({Key? key, required this.medicamentoManager}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

// Estado de la pantalla de inicio
class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    // Estructura de la pantalla con AppBar y cuerpo.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registrate",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF004E7F),
      ),
      body: cuerpo(context),
    );
  }
}

// Método que devuelve el cuerpo de la pantalla
Widget cuerpo(BuildContext context) {
  // Contenedor con degradado y elementos de la pantalla.
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF007BB5),
          Color(0xFF0093E9),
          Color(0xFF00AAFF),
        ],
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 60),
          login(),        // Llamada al widget de Inicio de sesion
          SizedBox(height: 30),
          user(),         // Llamada al widget de usuario
          SizedBox(height: 5),
          password(),     // Llamada al widget  de contraseña
          SizedBox(height: 30),
          botonEntrar(context), // Llamada al widget del botón de entrar en la app
          SizedBox(height: 5),
          botonCrear(context), // Llamada al widget del botón de crear cuenta
        ],
      ),
    ),
  );
}

// Widget que muestra el inicio de sesion.
Widget login() {
  return Text(
    "MEDICAMENTOS",
    style: TextStyle(
      color: Colors.white,
      fontSize: 40,
      fontWeight: FontWeight.w900,
      fontFamily: 'Serif ',
    ),
  );
}

// Widget que muestra el campo de entrada de usuario.
Widget user() {
  return Container(
    // Configuración del contenedor con relleno y estilo.
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextField(
      // Configuración del campo de entrada.
      decoration: InputDecoration(
        hintText: "Usuario",
        hintStyle: TextStyle(color: Color(0xFF00AAFF)),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

// Widget que muestra el campo de entrada de contraseña.
Widget password() {
  return Container(
    // Configuración del contenedor con relleno y estilo.
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextField(
      // Configuración del campo de entrada oculto para contraseñas.
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Contraseña",
        hintStyle: TextStyle(color: Color(0xFF00AAFF)),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

// Widget que muestra la app por primera vez.
Widget botonEntrar(BuildContext context) {
  return TextButton(
    // Estilo del botón con fondo blanco y bordes redondeados.
    style: TextButton.styleFrom(
      backgroundColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    onPressed: () {
      // Navegación a la pantalla de inicio.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    },
    child: Text(
      "Entrar",
      style: TextStyle(
        fontSize: 20,
        color: Color(0xFF00AAFF),
        fontWeight: FontWeight.w900,
      ),
    ),
  );
}

// Widget que muestra la ventana de crear cuenta.
Widget botonCrear(BuildContext context) {
  return TextButton(
    // Estilo del botón con fondo azul oscuro y bordes redondeados.
    style: TextButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 0, 22, 121),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    onPressed: () {
      // Navegación a la pantalla de creación de cuenta.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CrearUsuario()),
      );
    },
    child: Text(
      "Crear cuenta",
      style: TextStyle(
        fontSize: 20,
        color: Color.fromARGB(255, 226, 226, 226),
        fontWeight: FontWeight.w900,
      ),
    ),
  );
}
