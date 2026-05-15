class Alumno {
  final String nombre;
  final String apellido;
  final String codigo;
  final String carrera;
  final String ciclo;

  Alumno({
    required this.nombre,
    required this.apellido,
    required this.codigo,
    required this.carrera,
    required this.ciclo,
  });

  String get nombreCompleto => '$nombre $apellido';
}

// Lista global en memoria (sin base de datos)
final List<Alumno> alumnosGlobal = [
  Alumno(nombre: 'Ana',   apellido: 'García',  codigo: 'A001', carrera: 'Ing. de Sistemas', ciclo: '5'),
  Alumno(nombre: 'Luis',  apellido: 'Pérez',   codigo: 'A002', carrera: 'Administración',   ciclo: '3'),
  Alumno(nombre: 'María', apellido: 'Torres',  codigo: 'A003', carrera: 'Contabilidad',     ciclo: '7'),
];