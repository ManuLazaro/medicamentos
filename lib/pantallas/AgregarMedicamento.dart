import 'dart:io';
import 'package:flutter/material.dart';
import 'package:medicamentos/models/MedicamentoManager.dart';
import 'package:medicamentos/pantallas/DetallesMedicamentos.dart';

// Clase pantalla para agregar medicamentos.
class AgregarMedicamento extends StatefulWidget {
  final MedicamentoManager medicamentoManager;

  AgregarMedicamento({required this.medicamentoManager});

  @override
  _AgregarMedicamentoState createState() => _AgregarMedicamentoState();
}

class _AgregarMedicamentoState extends State<AgregarMedicamento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Medicamento'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.medicamentoManager.medicamentos.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      widget.medicamentoManager.medicamentos[index].nombre,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dosis por envase: ${widget.medicamentoManager.medicamentos[index].dosis}'),
                        Text('Existencias: ${widget.medicamentoManager.medicamentos[index].existencias}'),
                      ],
                    ),
                    leading: SizedBox(
                      width: 70,
                      height: 100,
                      child: widget.medicamentoManager.medicamentos[index].imagenPath != null
                          ? Image.file(
                              File(widget.medicamentoManager.medicamentos[index].imagenPath!),
                              fit: BoxFit.cover,
                            )
                          : Image.asset('assets/para.png'), // Cargar una imagen default si no hay una imagen seleccionada
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton.extended(
                onPressed: () async {
                  // Llama a la pantalla de detalles y espera la devolución de llamada.
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetallesMedicamentos(
                        onGuardar: (medicamento) {
                          // Agrega el medicamento a la lista y forza un redibujado.
                          widget.medicamentoManager.agregarMedicamento(medicamento);
                          setState(() {});
                        },
                      ),
                    ),
                  );
                },
                label: Text('Añadir Medicamento'),
                icon: Icon(Icons.add),
                backgroundColor: Colors.blue,
                elevation: 2.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
