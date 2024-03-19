import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicamentos/models/medicamento.dart';
import 'package:permission_handler/permission_handler.dart';

// Clase pantalla  detalles del medicamento.
class DetallesMedicamentos extends StatefulWidget {
  final Function(Medicamento) onGuardar;

  DetallesMedicamentos({required this.onGuardar});

  @override
  _DetallesMedicamentosState createState() => _DetallesMedicamentosState();
}

class _DetallesMedicamentosState extends State<DetallesMedicamentos> {
  // Controladores donde se rellena la informacion del medicamento
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController dosisController = TextEditingController();
  final TextEditingController tomaDiariaController = TextEditingController();
  final TextEditingController existenciasController = TextEditingController();
  late File? selectedImageFile;

  @override
  void initState() {
    super.initState();
    selectedImageFile = null; // Inicializa la imagen seleccionada de la galeria
  }

  // Solicita permisos para acceder a la galeria 
  Future<void> _requestGalleryPermission() async {
    var status = await Permission.photos.request();
    if (status.isGranted) {
      // Permiso concedido, puedes acceder a la galeria
      _selectImage();
    } else {
      // Permiso no concedido
    }
  }

  // Permite al usuario seleccionar una imagen de la galeria
  Future<void> _selectImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.getImage(
        source: ImageSource.gallery,
      );

      // Comprueba si se selecciono una imagen
      if (pickedFile != null) {
        // Actualiza el archivo de imagen si se selecciono una 
        selectedImageFile = File(pickedFile.path);
      }
      // Actualiza el estado solo si se seleccionó o deseleccionó una imagen.
      setState(() {});
    } catch (error) {
      print('Error al seleccionar la imagen: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al seleccionar la imagen.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Medicamento'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              GestureDetector(
                onTap: _selectImage,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: selectedImageFile != null
                      ? Image.file(
                          selectedImageFile!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 100,
                        )
                      : Center(
                          child: Icon(
                            Icons.add_a_photo,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 16.0),
              // Campos de entrada para los detalles del medicamento.
              TextField(
                controller: nombreController,
                decoration: InputDecoration(labelText: 'Nombre del Medicamento'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: dosisController,
                decoration: InputDecoration(labelText: 'Dosis por envase'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: tomaDiariaController,
                decoration: InputDecoration(labelText: 'Toma Diaria'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: existenciasController,
                decoration: InputDecoration(labelText: 'Existencias'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Sacar los valores ingresados por el usuario
                  String nombre = nombreController.text.trim();
                  String dosis = dosisController.text.trim();
                  String tomaDiaria = tomaDiariaController.text.trim();
                  String existencias = existenciasController.text.trim();

                  // Validaciones
                  if (nombre.isEmpty || dosis.isEmpty || tomaDiaria.isEmpty || existencias.isEmpty) {
                    // Muestra un mensaje de error si algún campo está vacío.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Todos los campos son obligatorios.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return; // Sale de la función si hay campos vacíos.
                  }

                  // Verifica que las existencias sean un numero valido 
                  try {
                    int.parse(existencias);
                  } catch (e) {
                    // Muestra un mensaje de error si no es un numero valido
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Ingrese un número válido para las existencias.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return; 
                  }

                  // Crea un objeto Medicamento con los detalles ingresados
                  Medicamento medicamento = Medicamento(
                    nombre: nombre,
                    dosis: dosis,
                    tomaDiaria: tomaDiaria,
                    existencias: existencias,
                    imagenPath: selectedImageFile?.path,
                  );

                  // Llama a la función de devolución de llamada para agregar el medicamento en la pantalla "Añadir Medicamento".
                  widget.onGuardar(medicamento);

                  // Cierra la pantalla actual.
                  Navigator.pop(context);
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


