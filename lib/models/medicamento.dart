// Clase para crear un medicamento
class Medicamento {
  final String nombre;
  final String dosis;
  final String tomaDiaria;
  final String existencias;
  final String? imagenPath;

  Medicamento({
    required this.nombre,
    required this.dosis,
    required this.tomaDiaria,
    required this.existencias,
    this.imagenPath,
  });
}