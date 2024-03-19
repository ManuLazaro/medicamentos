import 'package:flutter/material.dart';
import 'package:medicamentos/home.dart';

class CrearUsuario extends StatefulWidget {
  const CrearUsuario({Key? key}) : super(key: key);

  @override
  _CrearUsuarioState createState() => _CrearUsuarioState();
}

class _CrearUsuarioState extends State<CrearUsuario> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Crear Usuario",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 40, 42, 44),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height, // Ajusta la altura del Container al tamaño de la pantalla
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
                _login(),
                SizedBox(height: 30),
                _user(),
                SizedBox(height: 5),
                _password(),
                SizedBox(height: 5),
                _repetirPassword(),
                if (errorText != null)
                  Text(errorText!, style: TextStyle(color: Colors.red)),
                SizedBox(height: 10),
                _botonCrear(),
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom), // Ajusta el tamaño del Container para evitar el desbordamiento
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _login() {
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

  Widget _user() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: userController,
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

  Widget _password() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: passwordController,
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

  Widget _repetirPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: repeatPasswordController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Repetir contraseña",
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

  Widget _botonCrear() {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 0, 22, 121),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        setState(() {
          errorText = _validarCampos();
          if (errorText == null) {
            // Hacer algo con los datos válidos, como navegar a la próxima pantalla
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          }
        });
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

  String? _validarCampos() {
    if (userController.text.isEmpty ||
        passwordController.text.isEmpty ||
        repeatPasswordController.text.isEmpty) {
      return "Por favor, complete todos los campos.";
    } else if (passwordController.text != repeatPasswordController.text) {
      return "Las contraseñas no coinciden.";
    }
    return null;
  }
}
