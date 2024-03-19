/////////////////////////////////////////////////////////////////////
///////// Clase para gestionar la lista de medicamentos. ////////////
////////////////////////////////////////////////////////////////////

import 'package:medicamentos/models/medicamento.dart'; 
import 'package:medicamentos/pantallas/DetallesMedicamentos.dart'; 

class MedicamentoManager {
  // Lista que almacenará los objetos de tipo Medicamento
  List<Medicamento> medicamentos = []; 


  // Método para agregar un nuevo medicamento a la lista
  void agregarMedicamento(Medicamento medicamento) {
    medicamentos.add(medicamento); // Agrega el medicamento a la lista
  }
}
